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
#>                   package      cran     local behind
#> Matrix             Matrix     1.7.5     1.7.5  FALSE
#> R6                     R6     2.6.1     2.6.1  FALSE
#> RColorBrewer RColorBrewer     1.1.3     1.1.3  FALSE
#> Rcpp                 Rcpp 1.1.1.1.1 1.1.1.1.1  FALSE
#> RcppParallel RcppParallel  5.1.11.2  5.1.11.2  FALSE
#> S7                     S7     0.2.2     0.2.2  FALSE
#> askpass           askpass     1.2.1     1.2.1  FALSE
#> clipr               clipr     0.8.1     0.8.1  FALSE
#> commonmark     commonmark     2.0.0     2.0.0  FALSE
#> cpp11               cpp11     0.5.5         0   TRUE
#> credentials   credentials     2.0.3     2.0.3  FALSE
#> curl                 curl     7.1.0     7.1.0  FALSE
#> data.table     data.table    1.18.4    1.18.4  FALSE
#> desc                 desc     1.4.3     1.4.3  FALSE
#> digest             digest    0.6.39    0.6.39  FALSE
#> dplyr               dplyr     1.2.1     1.2.1  FALSE
#> farver             farver     2.1.2     2.1.2  FALSE
#> fs                     fs     2.1.0     2.1.0  FALSE
#> generics         generics     0.1.4     0.1.4  FALSE
#> gert                 gert     2.3.1     2.3.1  FALSE
#> ggfittext       ggfittext    0.10.3    0.10.3  FALSE
#> ggplot2           ggplot2     4.0.3     4.0.3  FALSE
#> gh                     gh     1.6.0     1.6.0  FALSE
#> gitcreds         gitcreds     0.1.2     0.1.2  FALSE
#> glue                 glue     1.8.1     1.8.1  FALSE
#> gridtext         gridtext     0.1.6     0.1.6  FALSE
#> gtable             gtable     0.3.6     0.3.6  FALSE
#> hms                   hms     1.1.4     1.1.4  FALSE
#> httr                 httr     1.4.8     1.4.8  FALSE
#> httr2               httr2     1.2.2     1.2.2  FALSE
#> ini                   ini     0.3.1     0.3.1  FALSE
#> isoband           isoband     0.3.0     0.3.0  FALSE
#> janitor           janitor     2.2.1     2.2.1  FALSE
#> jpeg                 jpeg    0.1.11    0.1.11  FALSE
#> jsonlite         jsonlite     2.0.0     2.0.0  FALSE
#> labeling         labeling     0.4.3     0.4.3  FALSE
#> lattice           lattice    0.22.9    0.22.9  FALSE
#> lifecycle       lifecycle     1.0.5     1.0.5  FALSE
#> litedown         litedown       0.9       0.9  FALSE
#> lubridate       lubridate     1.9.5     1.9.5  FALSE
#> magrittr         magrittr     2.0.5     2.0.5  FALSE
#> markdown         markdown       2.0       2.0  FALSE
#> mgcv                 mgcv     1.9.4     1.9.4  FALSE
#> mime                 mime      0.13      0.13  FALSE
#> nlme                 nlme   3.1.169   3.1.169  FALSE
#> nnet                 nnet    7.3.20    7.3.20  FALSE
#> openssl           openssl     2.4.2     2.4.2  FALSE
#> pillar             pillar    1.11.1    1.11.1  FALSE
#> pkgconfig       pkgconfig     2.0.3     2.0.3  FALSE
#> png                   png     0.1.9     0.1.9  FALSE
#> progressr       progressr    0.19.0    0.19.0  FALSE
#> purrr               purrr     1.2.2     1.2.2  FALSE
#> rappdirs         rappdirs     0.3.4     0.3.4  FALSE
#> rlang               rlang     1.2.0     1.2.0  FALSE
#> rprojroot       rprojroot     2.1.1     2.1.1  FALSE
#> rvest               rvest     1.0.5     1.0.5  FALSE
#> scales             scales     1.4.0     1.4.0  FALSE
#> selectr           selectr     0.5.1     0.5.1  FALSE
#> shades             shades     1.4.0     1.4.0  FALSE
#> snakecase       snakecase    0.11.1    0.11.1  FALSE
#> stringi           stringi     1.8.7     1.8.7  FALSE
#> stringr           stringr     1.6.0     1.6.0  FALSE
#> sys                   sys     3.4.3     3.4.3  FALSE
#> tibble             tibble     3.3.1     3.3.1  FALSE
#> tidyr               tidyr     1.3.2     1.3.2  FALSE
#> tidyselect     tidyselect     1.2.1     1.2.1  FALSE
#> timechange     timechange     0.4.0     0.4.0  FALSE
#> usethis           usethis     3.2.1     3.2.1  FALSE
#> utf8                 utf8     1.2.6     1.2.6  FALSE
#> vctrs               vctrs     0.7.3     0.7.3  FALSE
#> viridisLite   viridisLite     0.4.3     0.4.3  FALSE
#> whisker           whisker     0.4.1     0.4.1  FALSE
#> withr               withr     3.0.2     3.0.2  FALSE
#> xfun                 xfun      0.58      0.58  FALSE
#> xml2                 xml2     1.5.2     1.5.2  FALSE
#> yaml                 yaml    2.3.12    2.3.12  FALSE
#> zip                   zip     3.0.0     3.0.0  FALSE
```
