core <- c(
  "baseballr",
  "cfbfastR",
  "chessR",
  "fastRhockey",
  "hoopR",
  "toRvik",
  "wehoop"
)

get_repos <- function(){
  repo_urls <- c(
    "https://github.com/BillPetti/baseballr",
    "https://github.com/saiemgilani/cfbfastR",
    "https://github.com/JaseZiv/chessR",
    "https://github.com/benhowell71/fastRhockey",
    "https://github.com/saiemgilani/hoopR",
    "https://github.com/andreweatherman/toRvik",
    "https://github.com/saiemgilani/wehoop"
  )
  return(repo_urls)
}

#' @title List of all packages in the SportsDataverse
#' @return Returns a vector of the CRAN packages in the SportsDataverse
#' @export
get_core_functions <- function() {
  core <- c(
    "baseballr",
    "cfbfastR",
    "chessR",
    "fastRhockey",
    "hoopR",
    "toRvik",
    "wehoop"
  )
  return(core)
}
