# List all sportsdataverse dependencies

List all sportsdataverse dependencies

## Usage

``` r
sportsdataverse_deps(
  recursive = TRUE,
  pkg_list = get_core_functions(),
  repos = getOption("repos")
)
```

## Arguments

- recursive:

  If `TRUE`, will also list all dependencies of sportsdataverse
  packages.

- pkg_list:

  The list of the package names to check (including the
  `sportsdataverse` package itself) Defaults to `getOptions("repos")`.

- repos:

  The repositories to use to check for updates. Defaults to
  `getOptions("repos")`.

## Value

A `data.frame` with one row per dependency and columns `package`,
`cran`, `local`, and `behind`.

## Examples

``` r
  try(sportsdataverse_deps())
#>                   package      cran    local behind
#> Matrix             Matrix     1.7.6    1.7.5   TRUE
#> R6                     R6     2.6.1    2.6.1  FALSE
#> RColorBrewer RColorBrewer     1.1.3    1.1.3  FALSE
#> Rcpp                 Rcpp     1.1.2    1.1.2  FALSE
#> RcppEigen       RcppEigen 0.3.4.0.2        0   TRUE
#> RcppParallel RcppParallel     6.2.1    6.2.0   TRUE
#> S7                     S7     0.2.2    0.2.2  FALSE
#> askpass           askpass     1.2.1    1.2.1  FALSE
#> codetools       codetools    0.2.20   0.2.20  FALSE
#> commonmark     commonmark     2.0.0    2.0.0  FALSE
#> cpp11               cpp11     0.5.5        0   TRUE
#> curl                 curl     8.0.0    8.0.0  FALSE
#> data.table     data.table  1.18.6.1 1.18.6.1  FALSE
#> digest             digest    0.6.39   0.6.39  FALSE
#> dplyr               dplyr     1.2.1    1.2.1  FALSE
#> farver             farver     2.1.2    2.1.2  FALSE
#> foreach           foreach     1.5.2    1.5.2  FALSE
#> generics         generics     0.1.4    0.1.4  FALSE
#> ggfittext       ggfittext    0.10.4   0.10.4  FALSE
#> ggplot2           ggplot2     4.0.3    4.0.3  FALSE
#> glmnet             glmnet       5.0      5.0  FALSE
#> glue                 glue     1.8.1    1.8.1  FALSE
#> gridtext         gridtext     0.1.6    0.1.6  FALSE
#> gtable             gtable     0.3.6    0.3.6  FALSE
#> hms                   hms     1.1.4    1.1.4  FALSE
#> httr                 httr     1.4.8    1.4.8  FALSE
#> httr2               httr2     1.3.0    1.3.0  FALSE
#> isoband           isoband     0.3.0    0.3.0  FALSE
#> iterators       iterators    1.0.14   1.0.14  FALSE
#> janitor           janitor     2.2.1    2.2.1  FALSE
#> jpeg                 jpeg    0.1.11   0.1.11  FALSE
#> jsonlite         jsonlite     2.0.0    2.0.0  FALSE
#> labeling         labeling     0.4.3    0.4.3  FALSE
#> lattice           lattice    0.23.1   0.22.9   TRUE
#> lifecycle       lifecycle     1.0.5    1.0.5  FALSE
#> litedown         litedown      0.11     0.11  FALSE
#> lubridate       lubridate     1.9.5    1.9.5  FALSE
#> magrittr         magrittr     2.0.5    2.0.5  FALSE
#> markdown         markdown       2.0      2.0  FALSE
#> mgcv                 mgcv     1.9.4    1.9.4  FALSE
#> mime                 mime      0.13     0.13  FALSE
#> nlme                 nlme   3.1.170  3.1.169   TRUE
#> nnet                 nnet    7.3.21   7.3.20   TRUE
#> openssl           openssl     2.4.2    2.4.2  FALSE
#> pillar             pillar    1.11.1   1.11.1  FALSE
#> pkgconfig       pkgconfig     2.0.3    2.0.3  FALSE
#> png                   png     0.1.9    0.1.9  FALSE
#> progressr       progressr     1.0.0    1.0.0  FALSE
#> purrr               purrr     1.2.2    1.2.2  FALSE
#> rlang               rlang     1.3.0    1.3.0  FALSE
#> rvest               rvest     1.0.5    1.0.5  FALSE
#> scales             scales     1.4.0    1.4.0  FALSE
#> selectr           selectr     0.6.0    0.6.0  FALSE
#> shades             shades     1.5.0    1.5.0  FALSE
#> shape               shape   1.4.6.1  1.4.6.1  FALSE
#> snakecase       snakecase    0.11.1   0.11.1  FALSE
#> stringdist     stringdist    0.9.17   0.9.17  FALSE
#> stringi           stringi     1.8.9    1.8.9  FALSE
#> stringr           stringr     1.6.0    1.6.0  FALSE
#> survival         survival    3.8.11    3.8.6   TRUE
#> sys                   sys     3.4.3    3.4.3  FALSE
#> tibble             tibble     3.3.1    3.3.1  FALSE
#> tidyr               tidyr     1.3.2    1.3.2  FALSE
#> tidyselect     tidyselect     1.2.1    1.2.1  FALSE
#> timechange     timechange     0.4.0    0.4.0  FALSE
#> utf8                 utf8     1.2.6    1.2.6  FALSE
#> vctrs               vctrs     0.7.3    0.7.3  FALSE
#> viridisLite   viridisLite     0.4.3    0.4.3  FALSE
#> withr               withr     3.0.3    3.0.3  FALSE
#> xfun                 xfun      0.60     0.60  FALSE
#> xml2                 xml2     1.6.0    1.6.0  FALSE
```
