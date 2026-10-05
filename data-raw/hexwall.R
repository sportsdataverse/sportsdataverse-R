# Dependencies
library(magick)
library(purrr)

# path:             The path to a folder of hexagon stickers
# sticker_row_size: The number of stickers in the longest row
# sticker_width:    The width of each sticker in pixels
# remove_small:     Should hexagons smaller than the sticker_width be removed?
# coords:           A data.frame of coordinates defining the placement of hexagons
# scale_coords:     Should the coordinates be scaled to the hexagon size?
# remove_size:      Should hexagons of an abnormal size be removed?
# sort_mode:        How should the files be sorted?
# background_color: The colour of the background canvas
# n_stickers:       The number of hexagons to produce. Recycled in file order.
# center_sticker:   File name of a sticker to place in the middle of the wall
hexwall <- function(path="data-raw/samplehex",
                    sticker_row_size = 5,
                    sticker_width = 500,
                    remove_small = TRUE,
                    total_stickers = NULL,
                    remove_size = TRUE,
                    coords = NULL,
                    scale_coords = TRUE,
                    sort_mode = c("filename", "random", "color", "colour"),
                    background_color = 'transparent',
                    n_stickers = NULL,
                    center_sticker = NULL){
  sort_mode <- match.arg(sort_mode)

  # Load stickers
  sticker_files <- list.files(path)
  if(is.null(n_stickers)) n_stickers <- length(sticker_files)
  sticker_files <- rep_len(sticker_files, n_stickers)
  stickers <- file.path(path, sticker_files) %>%
    map(function(path){
      switch(tools::file_ext(path),
             svg = image_read_svg(path),
             pdf = image_read_pdf(path),
             image_read(path))
    }) %>%
    map(image_transparent, "transparent") %>%
    map(image_trim) %>%
    set_names(sticker_files)

  # Low resolution stickers
  low_res <- stickers %>%
    map_lgl(~ remove_small && image_info(.x)$width < (sticker_width-1)/2 && image_info(.x)$format != "svg")
  which(low_res)

  stickers <- stickers %>%
    map(image_scale, sticker_width)

  # Incorrectly sized stickers
  bad_size <- stickers %>%
    map_lgl(~ remove_size && with(image_info(.x), height < (median(height)-2) | height > (median(height) + 2)))
  which(bad_size)

  # Remove bad stickers
  sticker_rm <- low_res | bad_size
  stickers <- stickers[!sticker_rm]

  if(any(sticker_rm)){
    message(sprintf("Automatically removed %i incompatible stickers: %s",
                    sum(sticker_rm), paste0(names(sticker_rm[sticker_rm]), collapse = ", ")))
  }

  if(is.null(total_stickers)){
    if(!is.null(coords)){
      total_stickers <- NROW(coords)
    }
    else{
      total_stickers <- length(stickers)
    }
  }

  # Coerce sticker sizes
  sticker_height <- stickers %>%
    map(image_info) %>%
    map_dbl("height") %>%
    median
  stickers <- stickers %>%
    map(image_resize, paste0(sticker_width, "x", sticker_height, "!"))

  # Repeat stickers sorted by file name
  # rep_len() drops names; keep them, center_sticker looks stickers up by file name
  stickers <- stats::setNames(rep_len(stickers, total_stickers),
                              rep_len(names(stickers), total_stickers))

  if(sort_mode == "random"){
    # Randomly arrange stickers
    stickers <- sample(c(stickers, sample(stickers, total_stickers - length(stickers), replace = TRUE)))
  }
  else if(sort_mode %in% c("color", "colour")){
    # Sort stickers by colour
    sticker_col <- stickers %>%
      map(image_resize, "1x1!") %>%
      map(image_data) %>%
      map(~paste0("#", paste0(.[,,1], collapse=""))) %>%
      map(colorspace::hex2RGB) %>%
      map(as, "HSV") %>%
      map_dbl(~.@coords[,1]) %>%
      sort(index.return = TRUE) %>%
      .$ix

    stickers <- stickers[sticker_col]
  }

  if(is.null(coords)){
    # Arrange rows of stickers into images
    sticker_col_size <- ceiling(length(stickers)/(sticker_row_size-0.5))
    row_lens <- rep(c(sticker_row_size,sticker_row_size-1), length.out=sticker_col_size)
    # Drop rows that would start past the last sticker, then size the final row
    # to whatever remains. The previous correction subtracted the overflow from
    # the last row, which goes NEGATIVE whenever the sticker count does not tile
    # exactly (23 stickers gave 6 rows summing to 27, so the last row was
    # widened to 8 and indexed past the end). It only ever worked for counts
    # that happened to tile, which is why adding a hex broke it.
    row_lens <- row_lens[cumsum(row_lens) - row_lens < length(stickers)]
    row_lens[length(row_lens)] <- length(stickers) - sum(utils::head(row_lens, -1))
    # The canvas height is derived from the row count, so it has to follow the
    # trim: sticker_col_size still holds the pre-trim ESTIMATE (6 for 23
    # stickers, where row_lens ends up with 5), which allocated a whole extra
    # row of blank canvas at the foot of the wall.
    sticker_col_size <- length(row_lens)
    # Move the chosen sticker to the middle slot of the middle row.
    if(!is.null(center_sticker) && center_sticker %in% names(stickers)){
      mid_row <- ceiling(length(row_lens)/2)
      mid <- sum(utils::head(row_lens, mid_row - 1)) + ceiling(row_lens[mid_row]/2)
      # move ONE copy: with n_stickers/total_stickers recycling, a file can repeat
      i <- match(center_sticker, names(stickers))
      stickers <- append(stickers[-i], stickers[i], after = mid - 1)
    }
    sticker_rows <- map2(row_lens, cumsum(row_lens),
                         ~ seq(.y-.x+1, by = 1, length.out = .x)) %>%
      map(~ stickers[.x] %>%
            invoke(c, .) %>%
            image_append)

    # Add stickers to canvas. The background used to be hard-coded "white",
    # which ignored background_color and showed as a white box in dark mode.
    canvas <- image_blank(sticker_row_size*sticker_width,
                          sticker_height + (sticker_col_size-1)*sticker_height/1.33526, background_color)
    # Odd rows are offset half a sticker to interlock; a short row is also
    # shifted by whole stickers so it sits centred under the rows above it.
    row_x <- function(i){
      parity <- (i-1)%%2
      parity*sticker_width/2 + floor((sticker_row_size - parity - row_lens[i])/2)*sticker_width
    }
    reduce2(sticker_rows, seq_along(sticker_rows),
            # "over", not the default "atop": atop keeps the canvas alpha, so on a
            # transparent canvas nothing would be drawn at all
            ~ image_composite(
              ..1, ..2, operator = "over",
              offset = paste0("+", row_x(..3), "+", round((..3-1)*sticker_height/1.33526))
            ),
            .init = canvas)
  }
  else{
    sticker_pos <- coords
    if(scale_coords){
      sticker_pos <- sticker_pos %>%
        as_tibble %>%
        mutate_all(function(x){
          x <- x-min(x)
          dx <- diff(sort(abs(x)))
          x / min(dx[dx!=0])
        }) %>%
        mutate(y = y / min(diff(y)[diff(y)!=0])) %>%
        mutate(x = x*sticker_width/2,
               y = abs(y-max(y))*sticker_height/1.33526)
    }

    # Add stickers to canvas
    canvas <- image_blank(max(sticker_pos$x) + sticker_width,
                          max(sticker_pos$y) + sticker_height, background_color)
    reduce2(stickers, sticker_pos%>%split(1:NROW(.)),
            ~ image_composite(
              ..1, ..2, operator = "over",
              offset = paste0("+", ..3$x, "+", ..3$y)
            ),
            .init = canvas)
  }
}
png <- hexwall(center_sticker = "sportsdataverse.png")
magick::image_write(magick::image_scale(png,geometry="1000"), path = "man/figures/sdv-wall.png", format = "png", depth = 8)
