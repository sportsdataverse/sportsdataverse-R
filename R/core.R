core <- c(
  "baseballr",
  "cfbfastR",
  "cfbseedR",
  "fastRhockey",
  "hoopR",
  "mlbplotR",
  "oddsapiR",
  "sportyR",
  "wehoop"
)

get_repos <- function(){
  repo_urls <- c(
    "https://github.com/BillPetti/baseballr",
    "https://github.com/sportsdataverse/cfbfastR",
    "https://github.com/sportsdataverse/cfbseedR",
    "https://github.com/sportsdataverse/fastRhockey",
    "https://github.com/sportsdataverse/hoopR",
    "https://github.com/camdenk/mlbplotR",
    "https://github.com/sportsdataverse/oddsapiR",
    "https://github.com/sportsdataverse/sportyR",
    "https://github.com/sportsdataverse/wehoop"
  )
  return(repo_urls)
}

#' @title List of all packages in the SportsDataverse
#' @return Returns a vector of the CRAN packages in the SportsDataverse
#' @export
get_core_functions <- function() {
  core
}
