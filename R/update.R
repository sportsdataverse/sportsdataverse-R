#' Update sportsdataverse packages
#'
#' This will check to see if all sportsdataverse packages (and optionally, their
#' dependencies) are up-to-date, and will install after an interactive
#' confirmation.
#'
#' @inheritParams sportsdataverse_deps
#' @export
#' @examples
#' \dontrun{
#' sportsdataverse_update()
#' }
sportsdataverse_update <- function(recursive = FALSE, repos = getOption("repos")) {

  deps <- sportsdataverse_deps(recursive, repos)
  behind <- dplyr::filter(deps, behind)

  if (nrow(behind) == 0) {
    cli::cat_line("All sportsdataverse packages up-to-date")
    return(invisible())
  }

  cli::cat_line("The following packages are out of date:")
  cli::cat_line()
  cli::cat_bullet(format(behind$package), " (", behind$local, " -> ", behind$cran, ")")

  cli::cat_line()
  cli::cat_line("Start a clean R session then run:")

  pkg_str <- paste0(deparse(behind$package), collapse = "\n")
  cli::cat_line("install.packages(", pkg_str, ")")

  invisible()
}

#' Get a situation report on the sportsdataverse
#'
#' This function gives a quick overview of the versions of R and RStudio as
#' well as all sportsdataverse packages. It's primarily designed to help you get
#' a quick idea of what's going on when you're helping someone else debug
#' a problem.
#'
#' @export
sportsdataverse_sitrep <- function() {
  cli::cat_rule("R & RStudio")
  if (rstudioapi::isAvailable()) {
    cli::cat_bullet("RStudio: ", rstudioapi::getVersion())
  }
  cli::cat_bullet("R: ", getRversion())

  deps <- sportsdataverse_deps()
  package_pad <- format(deps$package)
  packages <- ifelse(
    deps$behind,
    paste0(cli::col_yellow(cli::style_bold(package_pad)), " (", deps$local, " < ", deps$cran, ")"),
    paste0(package_pad, " (", deps$cran, ")")
  )

  cli::cat_rule("Core packages")
  cli::cat_bullet(packages[deps$package %in% core])
  cli::cat_rule("Non-core packages")
  cli::cat_bullet(packages[!deps$package %in% core])
}

#' List all sportsdataverse dependencies
#'
#' @param recursive If \code{TRUE}, will also list all dependencies of
#'   sportsdataverse packages.
#' @param pkg_list The list of the package names to check (including the `sportsdataverse` package itself)
#'   Defaults to \code{getOptions("repos")}.
#' @param repos The repositories to use to check for updates.
#'   Defaults to \code{getOptions("repos")}.
#' @importFrom rlang .data
#' @export

sportsdataverse_deps <- function(recursive = TRUE,
                                 pkg_list = get_core_functions(),
                                 repos = getOption("repos")) {
  pkgs <- utils::available.packages(repos = repos)
  pkgs_in_sdv <- pkgs  %>%
    as.data.frame() %>%
    dplyr::filter(.data$Package %in% pkg_list)

  deps <- tools::package_dependencies(pkg_list, pkgs_in_sdv, recursive = recursive)

  pkg_deps <- unique(sort(unlist(deps)))

  base_pkgs <- c(
    "base", "compiler", "datasets", "graphics", "grDevices", "grid",
    "methods", "parallel", "splines", "stats", "stats4", "tools", "tcltk",
    "utils"
  )
  pkg_deps <- setdiff(pkg_deps, base_pkgs)

  tool_pkgs <- c("cli", "crayon", "rstudioapi")
  pkg_deps <- setdiff(pkg_deps, tool_pkgs)

  cran_version <- lapply(pkgs[pkg_deps, "Version"], base::package_version)
  local_version <- lapply(pkg_deps, packageVersion)

  behind <- purrr::map2_lgl(cran_version, local_version, `>`)

  tibble::tibble(
    package = pkg_deps,
    cran = cran_version %>% purrr::map_chr(as.character),
    local = local_version %>% purrr::map_chr(as.character),
    behind = behind
  )
}

packageVersion <- function(pkg) {
  if (rlang::is_installed(pkg)) {
    utils::packageVersion(pkg)
  } else {
    0
  }
}



#' The sportsdataverse logo, using ASCII or Unicode characters
#'
#' Use [crayon::strip_style()] to get rid of the colors.
#'
#' @param unicode Whether to use Unicode symbols. Default is `TRUE`
#'   on UTF-8 platforms.
#'
#' @md
#' @export
#' @examples
#' sportsdataverse_logo()

sportsdataverse_logo <- function(unicode = l10n_info()$`UTF-8`) {
  logo <- c(
    "                          __      ",
    "   _________  ____  _____/ /______",
    "  / ___/ __ \\/ __ \\/ ___/ __/ ___/",
    " (__  / /_/ / /_/ / /  / /_(__  ) ",
    "/____/ ____/\\____/_/   \\__/____/ ",
    "    /_/_/ /___ _/ /_____ _ ",
    "   / __  / __ `/ __/ __ `/",
    "  / /_/ / /_/ / /_/ /_/ /",
    " _\\_____\\_____\\___\\_____\\ ",
    "| | / / _ \ /`__/ ___/ _ \\ ",
    "| |/ /  __/ / (__  /  __/",
    "|___/\\___/_/ /____/\\___/"
  )


  # hexa <- c("*", ".", "o", "*", ".", "*", ".", "o", ".", "*", "o")
  # if (unicode) hexa <- c("*" = "\u2b22", "o" = "\u2b21", "." = ".")[hexa]
  #
  # cols <- c("red", "yellow", "green", "magenta", "cyan",
  #           "yellow", "green", "white", "magenta", "cyan", "green")
  #
  # col_hexa <- purrr::map2(hexa, cols, ~ crayon::make_style(.y)(.x))
  #
  # for (i in 0:10) {
  #   pat <- paste0("\\b", i, "\\b")
  #   logo <- sub(pat, col_hexa[[i + 1]], logo)
  # }


  print.sportsdataverse_logo(logo)
}

#' @export

print.sportsdataverse_logo <- function(x, ...) {
  cat(x, ..., sep = "\n")
  invisible(x)
}
