# Update sportsdataverse packages

This will check to see if all sportsdataverse packages (and optionally,
their dependencies) are up-to-date, and prints the install command
needed to bring any out-of-date packages current.

## Usage

``` r
sportsdataverse_update(
  recursive = FALSE,
  repos = getOption("repos"),
  devel = FALSE
)
```

## Arguments

- recursive:

  If `TRUE`, will also list all dependencies of sportsdataverse
  packages.

- repos:

  The repositories to use to check for updates. Defaults to
  `getOptions("repos")`.

- devel:

  If `TRUE`, look for prebuilt development versions on the
  SportsDataverse r-universe (<https://sportsdataverse.r-universe.dev>)
  so it is possible to install development versions without GitHub.

## Value

Returns `NULL` invisibly. Called for its side effects.

## Examples

``` r
# \donttest{
try(sportsdataverse_update())
#> ℹ The following packages are out of date:
#> • Matrix       (1.7.5  -> 1.7.6 )
#> • RcppParallel (6.2.0  -> 6.2.1 )
#> • nnet         (7.3.20 -> 7.3.21)
#> ── Start a clean R session then run ────────────────────────────────────────────
#> install.packages(c("Matrix", "RcppParallel", "nnet"))
#> ────────────────────────────────────────────────────────────────────────────────
# }
```
