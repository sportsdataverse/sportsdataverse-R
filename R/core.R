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

#' @title List of all packages in the SportsDataverse
#' @return A character vector of the CRAN packages that
#'   `library(sportsdataverse)` attaches.
#' @export
#' @examples
#' get_core_functions()
get_core_functions <- function() {
  core
}
