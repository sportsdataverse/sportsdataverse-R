# Update sportsdataverse packages

This will check to see if all sportsdataverse packages (and optionally,
their dependencies) are up-to-date, and will install after an
interactive confirmation.

## Usage

``` r
sportsdataverse_update(recursive = FALSE, repos = getOption("repos"))
```

## Arguments

- recursive:

  If `TRUE`, will also list all dependencies of sportsdataverse
  packages.

- repos:

  The repositories to use to check for updates. Defaults to
  `getOptions("repos")`.

## Examples

``` r
if (FALSE) { # \dontrun{
sportsdataverse_update()
} # }
```
