# sportsdataverse 0.3.0

* Trimmed the meta-package dependencies to mirror the `nflverse` model: the
  package now imports only `cli`, `crayon`, `magrittr`, `rlang`, and
  `rstudioapi` alongside the core SportsDataverse packages. `sportsdataverse_deps()`
  and `sportsdataverse_update()` were rewritten in base R, dropping the `dplyr`,
  `purrr`, and `tibble` imports.
* `sportsdataverse_update()` gained a `devel` argument that points at the
  SportsDataverse r-universe (<https://sportsdataverse.r-universe.dev>) for
  prebuilt development binaries, and now reports via `cli`.
* Bumped the minimum R version to 4.1.0 and added `Config/testthat/edition: 3`.
* Updated the core package roster to reflect the current CRAN-published
  SportsDataverse R packages.
* Added `cfbseedR` (college football season and playoff-seeding simulation)
  and `mlbplotR` (MLB logos, headshots, and plot themes) to the core roster;
  `library(sportsdataverse)` now attaches both.
* Bumped the minimum versions of imported packages to their current CRAN
  releases: `baseballr` (>= 2.0.0), `cfbfastR` (>= 3.0.0), `cfbseedR`
  (>= 0.2.0), `fastRhockey` (>= 1.0.0), `hoopR` (>= 3.1.0), `mlbplotR`
  (>= 1.2.0), `oddsapiR` (>= 1.0.1), `sportyR` (>= 2.2.3), and `wehoop`
  (>= 3.0.0).
* `get_core_functions()` now returns the package's single roster vector
  instead of a separately maintained copy.
* GitHub Actions: workflows moved to `actions/checkout@v6` (Node 24 runtime),
  gained explicit `permissions` and `concurrency` groups, and R CMD check now
  also runs on macOS. The pkgdown build moved off the pinned Ubuntu 22.04
  image to `ubuntu-latest` with Posit Public Package Manager binaries, and
  its dependency list was trimmed to `pkgdown` plus the package itself.
* Removed `worldfootballR` from the SportsDataverse roster (its upstream
  repository has been archived).
* Dropped the already-commented archived packages (`chessR`, `hockeyR`,
  `toRvik`) from the README package roster.
* Switched the README installation instructions from `pacman` to `pak`.
* Pointed `URL`/`BugReports` at the `sportsdataverse` GitHub organization and
  added the pkgdown site (<https://r.sportsdataverse.org>).

# sportsdataverse 0.1.0

* Added a `NEWS.md` file to track changes to the package.
