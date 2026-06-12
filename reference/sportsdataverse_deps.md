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

## Examples

``` r
  try(sportsdataverse_deps() %>% knitr::kable())
#> 
#> 
#> |package      |cran      |local     |behind |
#> |:------------|:---------|:---------|:------|
#> |Rcpp         |1.1.1.1.1 |1.1.1.1.1 |FALSE  |
#> |RcppParallel |5.1.11.2  |5.1.11.2  |FALSE  |
#> |curl         |7.1.0     |7.1.0     |FALSE  |
#> |data.table   |1.18.4    |1.18.4    |FALSE  |
#> |dplyr        |1.2.1     |1.2.1     |FALSE  |
#> |ggfittext    |0.10.3    |0.10.3    |FALSE  |
#> |ggplot2      |4.0.3     |4.0.3     |FALSE  |
#> |glue         |1.8.1     |1.8.1     |FALSE  |
#> |httr         |1.4.8     |1.4.8     |FALSE  |
#> |httr2        |1.2.2     |1.2.2     |FALSE  |
#> |janitor      |2.2.1     |2.2.1     |FALSE  |
#> |jsonlite     |2.0.0     |2.0.0     |FALSE  |
#> |lifecycle    |1.0.5     |1.0.5     |FALSE  |
#> |lubridate    |1.9.5     |1.9.5     |FALSE  |
#> |magrittr     |2.0.5     |2.0.5     |FALSE  |
#> |mgcv         |1.9.4     |1.9.4     |FALSE  |
#> |nnet         |7.3.20    |7.3.20    |FALSE  |
#> |progress     |1.2.3     |1.2.3     |FALSE  |
#> |progressr    |0.19.0    |0.19.0    |FALSE  |
#> |purrr        |1.2.2     |1.2.2     |FALSE  |
#> |qdapRegex    |0.7.10    |0.7.10    |FALSE  |
#> |readr        |2.2.0     |2.2.0     |FALSE  |
#> |rlang        |1.2.0     |1.2.0     |FALSE  |
#> |rvest        |1.0.5     |1.0.5     |FALSE  |
#> |stringi      |1.8.7     |1.8.7     |FALSE  |
#> |stringr      |1.6.0     |1.6.0     |FALSE  |
#> |tibble       |3.3.1     |3.3.1     |FALSE  |
#> |tidyr        |1.3.2     |1.3.2     |FALSE  |
#> |tidyselect   |1.2.1     |1.2.1     |FALSE  |
#> |usethis      |3.2.1     |3.2.1     |FALSE  |
#> |withr        |3.0.2     |3.0.2     |FALSE  |
#> |xml2         |1.5.2     |1.5.2     |FALSE  |
```
