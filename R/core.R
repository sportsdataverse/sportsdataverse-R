core <- c(
  "baseballr",
  "cfbfastR",
  "chessR",
  "fastRhockey",
  # "hockeyR",
  "hoopR",
  "oddsapiR",
  "sportyR",
  # "toRvik",
  "wehoop",
  "worldfootballR"
)

get_repos <- function(){
  repo_urls <- c(
    "https://github.com/BillPetti/baseballr",
    "https://github.com/sportsdataverse/cfbfastR",
    "https://github.com/JaseZiv/chessR",
    "https://github.com/sportsdataverse/fastRhockey",
    # "https://github.com/danmorse314/hockeyR/",
    "https://github.com/sportsdataverse/hoopR",
    "https://github.com/sportsdataverse/oddsapiR",
    "https://github.com/sportsdataverse/sportyR",
    # "https://github.com/andreweatherman/toRvik",
    "https://github.com/sportsdataverse/wehoop",
    "https://github.com/JaseZiv/worldfootballR"
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
    # "hockeyR",
    "hoopR",
    "oddsapiR",
    "sportyR",
    # "toRvik",
    "wehoop",
    "worldfootballR"
  )
  return(core)
}
