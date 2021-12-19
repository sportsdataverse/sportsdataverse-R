#' List all packages in the sportsdataverse
#'
#' @param include_self Include sportsdataverse in the list?
#' @export
#' @examples
#' sportsdataverse_packages()
sportsdataverse_packages <- function(include_self = TRUE) {
  raw <- utils::packageDescription("sportsdataverse")$Imports
  imports <- strsplit(raw, ",")[[1]]
  parsed <- gsub("^\\s+|\\s+$", "", imports)
  names <- vapply(strsplit(parsed, "\\s+"), "[[", 1, FUN.VALUE = character(1))
  if (include_self) {
    names <- c(names, "sportsdataverse")
  }
  exclude <- c("cli", "crayon", "dplyr", "magrittr", "purrr",
               "rlang", "rstudioapi", "tibble" )
  names <- names[!names %in% exclude] %>% sort()
  names
}
