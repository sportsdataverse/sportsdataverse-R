## Submission summary

This is a new submission.

`sportsdataverse` is a meta-package in the style of `tidyverse` and
`nflverse`: it installs and attaches the CRAN-published SportsDataverse R
packages (`baseballr`, `cfbfastR`, `cfbseedR`, `fastRhockey`, `hoopR`,
`mlbplotR`, `oddsapiR`, `sportyR`, `wehoop`) in one step and provides
helpers to report and update their versions. Every imported package is on
CRAN, and each `Imports` floor is that package's current CRAN release.

## Test environments

* local: Ubuntu 24.04, R 4.6.1
* GitHub Actions: macOS-latest (release), windows-latest (release),
  ubuntu-latest (release, oldrel-1)

## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new submission.

## Reverse dependencies

There are currently no reverse dependencies, as this is a new package.
