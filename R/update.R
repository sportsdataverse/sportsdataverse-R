#' Update sportsdataverse packages
#'
#' This will check to see if all sportsdataverse packages (and optionally, their
#' dependencies) are up-to-date, and prints the install command needed to bring
#' any out-of-date packages current.
#'
#' @inheritParams sportsdataverse_deps
#' @param devel If `TRUE`, look for prebuilt development versions on the
#'   SportsDataverse r-universe (<https://sportsdataverse.r-universe.dev>) so it
#'   is possible to install development versions without GitHub.
#' @returns Returns `NULL` invisibly. Called for its side effects.
#' @export
#' @examples
#' \donttest{
#' try(sportsdataverse_update())
#' }
sportsdataverse_update <- function(recursive = FALSE,
                                   repos = getOption("repos"),
                                   devel = FALSE) {
  if (isTRUE(devel)) {
    repos["sportsdataverse"] <- "https://sportsdataverse.r-universe.dev"
  }

  deps <- sportsdataverse_deps(recursive = recursive, repos = repos)
  behind <- deps[deps$behind %in% TRUE, , drop = FALSE]

  if (nrow(behind) == 0) {
    cli::cli_alert_success("All {.field sportsdataverse} packages are up-to-date!")
    return(invisible())
  }

  cli::cli_alert_info(
    "The following {cli::qty(nrow(behind))}package{?s} {?is/are} out of date:"
  )
  cli::cat_bullet(
    format(behind$package), " (", format(behind$local), " -> ", format(behind$cran), ")"
  )

  pkg_str <- paste0(deparse(behind$package), collapse = "\n")
  if (isTRUE(devel)) {
    out_string <- paste0(
      "install.packages(", pkg_str,
      ',\n  repos = c("https://sportsdataverse.r-universe.dev", getOption("repos")))'
    )
  } else {
    out_string <- paste0("install.packages(", pkg_str, ")")
  }

  cli::cli_rule(left = "Start a clean R session then run")
  cli::cli_code(out_string)
  cli::cli_rule()

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
#' @returns A `data.frame` with one row per dependency and columns `package`,
#'   `cran`, `local`, and `behind`.
#' @export
#' @examples
#'   try(sportsdataverse_deps())
#'

sportsdataverse_deps <- function(recursive = TRUE,
                                 pkg_list = get_core_functions(),
                                 repos = getOption("repos")) {
  pkgs <- utils::available.packages(repos = repos)
  available_pkgs <- intersect(pkg_list, rownames(pkgs))

  deps <- tools::package_dependencies(available_pkgs, db = pkgs, recursive = recursive)
  pkg_deps <- unique(sort(unlist(deps)))

  base_pkgs <- c(
    "base", "compiler", "datasets", "graphics", "grDevices", "grid",
    "methods", "parallel", "splines", "stats", "stats4", "tools", "tcltk",
    "utils"
  )
  pkg_deps <- setdiff(pkg_deps, base_pkgs)

  tool_pkgs <- c("cli", "crayon", "rstudioapi")
  pkg_deps <- setdiff(pkg_deps, tool_pkgs)

  # keep only deps we can resolve a CRAN/r-universe version for
  pkg_deps <- intersect(pkg_deps, rownames(pkgs))

  cran_version <- as.character(base::package_version(pkgs[pkg_deps, "Version"]))
  local_version <- vapply(pkg_deps, packageVersion, FUN.VALUE = character(1))

  behind <- mapply(
    function(cv, lv) utils::compareVersion(cv, lv) > 0,
    cran_version, local_version
  )

  data.frame(
    package = pkg_deps,
    cran = cran_version,
    local = local_version,
    behind = unname(behind),
    stringsAsFactors = FALSE
  )
}

packageVersion <- function(pkg) {
  if (rlang::is_installed(pkg)) {
    as.character(utils::packageVersion(pkg))
  } else {
    "0"
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
