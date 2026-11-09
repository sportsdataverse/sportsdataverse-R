# **sportsdataverse**

The [**`sportsdataverse`**](https://r.sportsdataverse.org) is a set of
sports data packages that work in harmony because they share common data
representations and API design. This package is designed to make it easy
to install and load multiple **`sportsdataverse`** packages in a single
step. Learn more about the **`sportsdataverse`** at
[sportsdataverse.org](https://sportsdataverse.org).

Data freshness and pipeline status for every SportsDataverse dataset:
[sportsdataverse.org/status](https://sportsdataverse.org/status).

## **Installation**

You can install the latest build from
[R-universe](https://sportsdataverse.r-universe.dev/sportsdataverse)
with:

``` r

install.packages("sportsdataverse", repos = c("https://sportsdataverse.r-universe.dev", getOption("repos")))
```

You can install the development version of
[**`sportsdataverse`**](https://github.com/sportsdataverse/sportsdataverse-R/)
from GitHub with:

``` r

if (!requireNamespace("pak", quietly = TRUE)) install.packages("pak")
pak::pak("sportsdataverse/sportsdataverse-R")
# or, with remotes:
# if (!requireNamespace("remotes", quietly = TRUE)) install.packages("remotes")
# remotes::install_github("sportsdataverse/sportsdataverse-R")
```

## **Quick start**

``` r

library(sportsdataverse)

# Report the installed versions of the SportsDataverse packages
sportsdataverse_sitrep()

# Check for out-of-date SportsDataverse packages and print the install command
sportsdataverse_update()
```

[`library(sportsdataverse)`](https://github.com/sportsdataverse/sportsdataverse-R)
will load the following packages:

- [**`baseballr`**](https://billpetti.github.io/baseballr/), for MLB and
  college baseball data.
- [**`cfbfastR`**](https://cfbfastR.sportsdataverse.org/), for college
  football data.
- [**`cfbseedR`**](https://cfbseedR.sportsdataverse.org/), for
  simulating college football seasons and playoff seeding.
- [**`fastRhockey`**](https://fastRhockey.sportsdataverse.org/), for NHL
  and PWHL hockey data.
- [**`hoopR`**](https://hoopR.sportsdataverse.org/), for men’s college
  and professional basketball data.
- [**`mlbplotR`**](https://camdenk.github.io/mlbplotR/), for MLB team
  and player logos, headshots, and plot themes.
- [**`oddsapiR`**](https://oddsapiR.sportsdataverse.org/), for
  sportsbook odds from The Odds API.
- [**`sportyR`**](https://sportyR.sportsdataverse.org/), for drawing
  regulation playing surfaces.
- [**`wehoop`**](https://wehoop.sportsdataverse.org/), for women’s
  college and professional basketball data.

Additional ecosystem packages —
[**`cfbplotR`**](https://cfbplotR.sportsdataverse.org/),
[**`cfb4th`**](https://cfb4th.sportsdataverse.org/),
[**`recruitR`**](https://recruitR.sportsdataverse.org/), and
[**`softballR`**](https://github.com/sportsdataverse/softballR/) — are
available in the SportsDataverse but are not auto-loaded by
[`library(sportsdataverse)`](https://github.com/sportsdataverse/sportsdataverse-R).

``` r

sportsdataverse::sportsdataverse_logo()
```

![SportsDataverse unicode
logo](https://raw.githubusercontent.com/sportsdataverse/sportsdataverse-R/main/data-raw/sportsdataverse-unicode-logo.png)

## **R Packages in the SportsDataverse**

[![SportsDataverse package
wall](https://raw.githubusercontent.com/sportsdataverse/sportsdataverse-R/main/man/figures/sdv-wall.png)](https://R.sportsdataverse.org/)

### [**`cfbfastR`**](https://cfbfastR.sportsdataverse.org/)

[![Version-Number](https://img.shields.io/github/r-package/v/sportsdataverse/cfbfastR?label=cfbfastR&logo=R&style=for-the-badge)](https://github.com/sportsdataverse/cfbfastR)
[![R-CMD-check](https://img.shields.io/github/actions/workflow/status/sportsdataverse/cfbfastR/R-CMD-check.yaml?branch=main&label=R-CMD-Check&logo=R&logoColor=white&style=for-the-badge)](https://github.com/sportsdataverse/cfbfastR/actions/workflows/R-CMD-check.yaml)
[![CRAN
Status](https://img.shields.io/cran/v/cfbfastR?color=success&label=CRAN%20Version&logo=R&style=for-the-badge)](https://CRAN.R-project.org/package=cfbfastR)
[![CRAN
downloads](https://img.shields.io/badge/dynamic/json?style=for-the-badge&color=success&label=Downloads&query=%24%5B0%5D.downloads&url=https%3A%2F%2Fcranlogs.r-pkg.org%2Fdownloads%2Ftotal%2F2021-10-26%3Alast-day%2FcfbfastR)](https://CRAN.R-project.org/package=cfbfastR)

### [**`cfbseedR`**](https://cfbseedR.sportsdataverse.org/)

[![Version-Number](https://img.shields.io/github/r-package/v/sportsdataverse/cfbseedR?label=cfbseedR&logo=R&style=for-the-badge)](https://github.com/sportsdataverse/cfbseedR)
[![R-CMD-check](https://img.shields.io/github/actions/workflow/status/sportsdataverse/cfbseedR/R-CMD-check.yaml?branch=main&label=R-CMD-Check&logo=R&logoColor=white&style=for-the-badge)](https://github.com/sportsdataverse/cfbseedR/actions/workflows/R-CMD-check.yaml)
[![CRAN
Status](https://img.shields.io/cran/v/cfbseedR?color=success&label=CRAN%20Version&logo=R&style=for-the-badge)](https://CRAN.R-project.org/package=cfbseedR)
[![CRAN
downloads](https://img.shields.io/badge/dynamic/json?style=for-the-badge&color=success&label=Downloads&query=%24%5B0%5D.downloads&url=https%3A%2F%2Fcranlogs.r-pkg.org%2Fdownloads%2Ftotal%2F2021-10-26%3Alast-day%2FcfbseedR)](https://CRAN.R-project.org/package=cfbseedR)

### [**`hoopR`**](https://hoopr.sportsdataverse.org/)

[![Version-Number](https://img.shields.io/github/r-package/v/sportsdataverse/hoopR?label=hoopR&logo=R&style=for-the-badge)](https://github.com/sportsdataverse/hoopR)
[![R-CMD-check](https://img.shields.io/github/actions/workflow/status/sportsdataverse/hoopR/R-CMD-check.yaml?branch=main&label=R-CMD-Check&logo=R&logoColor=white&style=for-the-badge)](https://github.com/sportsdataverse/hoopR/actions/workflows/R-CMD-check.yaml)
[![CRAN
Status](https://img.shields.io/cran/v/hoopR?color=success&label=CRAN%20Version&logo=R&style=for-the-badge)](https://CRAN.R-project.org/package=hoopR)
[![CRAN
downloads](https://img.shields.io/badge/dynamic/json?style=for-the-badge&color=success&label=Downloads&query=%24%5B0%5D.downloads&url=https%3A%2F%2Fcranlogs.r-pkg.org%2Fdownloads%2Ftotal%2F2021-10-26%3Alast-day%2FhoopR)](https://CRAN.R-project.org/package=hoopR)

### [**`wehoop`**](https://wehoop.sportsdataverse.org/)

[![Version-Number](https://img.shields.io/github/r-package/v/sportsdataverse/wehoop?label=wehoop&logo=R&style=for-the-badge)](https://github.com/sportsdataverse/wehoop)
[![R-CMD-check](https://img.shields.io/github/actions/workflow/status/sportsdataverse/wehoop/R-CMD-check.yaml?branch=main&label=R-CMD-Check&logo=R&logoColor=white&style=for-the-badge)](https://github.com/sportsdataverse/wehoop/actions/workflows/R-CMD-check.yaml)
[![CRAN
Status](https://img.shields.io/cran/v/wehoop?color=success&label=CRAN%20Version&logo=R&style=for-the-badge)](https://CRAN.R-project.org/package=wehoop)
[![CRAN
downloads](https://img.shields.io/badge/dynamic/json?style=for-the-badge&color=success&label=Downloads&query=%24%5B0%5D.downloads&url=https%3A%2F%2Fcranlogs.r-pkg.org%2Fdownloads%2Ftotal%2F2021-10-26%3Alast-day%2Fwehoop)](https://CRAN.R-project.org/package=wehoop)

### [**`fastRhockey`**](https://fastRhockey.sportsdataverse.org/)

[![Version-Number](https://img.shields.io/github/r-package/v/sportsdataverse/fastRhockey?label=fastRhockey&logo=R&style=for-the-badge)](https://github.com/sportsdataverse/fastRhockey)
[![R-CMD-check](https://img.shields.io/github/actions/workflow/status/sportsdataverse/fastRhockey/R-CMD-check.yaml?branch=main&label=R-CMD-Check&logo=R&logoColor=white&style=for-the-badge)](https://github.com/sportsdataverse/fastRhockey/actions/workflows/R-CMD-check.yaml)
[![CRAN
Status](https://img.shields.io/cran/v/fastRhockey?color=success&label=CRAN%20Version&logo=R&style=for-the-badge)](https://CRAN.R-project.org/package=fastRhockey)
[![CRAN
downloads](https://img.shields.io/badge/dynamic/json?style=for-the-badge&color=success&label=Downloads&query=%24%5B0%5D.downloads&url=https%3A%2F%2Fcranlogs.r-pkg.org%2Fdownloads%2Ftotal%2F2021-10-26%3Alast-day%2FfastRhockey)](https://CRAN.R-project.org/package=fastRhockey)

### [**`baseballr`**](https://billpetti.github.io/baseballr/)

[![Version-Number](https://img.shields.io/github/r-package/v/BillPetti/baseballr?label=baseballr&logo=R&style=for-the-badge)](https://github.com/BillPetti/baseballr)
[![R-CMD-check](https://img.shields.io/github/actions/workflow/status/BillPetti/baseballr/R-CMD-check.yaml?branch=master&label=R-CMD-Check&logo=R&logoColor=white&style=for-the-badge)](https://github.com/BillPetti/baseballr/actions/workflows/R-CMD-check.yaml)
[![CRAN
Status](https://img.shields.io/cran/v/baseballr?color=success&label=CRAN%20Version&logo=R&style=for-the-badge)](https://CRAN.R-project.org/package=baseballr)
[![CRAN
downloads](https://img.shields.io/badge/dynamic/json?style=for-the-badge&color=success&label=Downloads&query=%24%5B0%5D.downloads&url=https%3A%2F%2Fcranlogs.r-pkg.org%2Fdownloads%2Ftotal%2F2021-10-26%3Alast-day%2Fbaseballr)](https://CRAN.R-project.org/package=baseballr)

### [**`mlbplotR`**](https://camdenk.github.io/mlbplotR/)

[![Version-Number](https://img.shields.io/github/r-package/v/camdenk/mlbplotR?label=mlbplotR&logo=R&style=for-the-badge)](https://github.com/camdenk/mlbplotR)
[![R-CMD-check](https://img.shields.io/github/actions/workflow/status/camdenk/mlbplotR/R-CMD-check.yaml?branch=main&label=R-CMD-Check&logo=R&logoColor=white&style=for-the-badge)](https://github.com/camdenk/mlbplotR/actions/workflows/R-CMD-check.yaml)
[![CRAN
Status](https://img.shields.io/cran/v/mlbplotR?color=success&label=CRAN%20Version&logo=R&style=for-the-badge)](https://CRAN.R-project.org/package=mlbplotR)
[![CRAN
downloads](https://img.shields.io/badge/dynamic/json?style=for-the-badge&color=success&label=Downloads&query=%24%5B0%5D.downloads&url=https%3A%2F%2Fcranlogs.r-pkg.org%2Fdownloads%2Ftotal%2F2021-10-26%3Alast-day%2FmlbplotR)](https://CRAN.R-project.org/package=mlbplotR)

### [**`sportyR`**](https://sportyr.sportsdataverse.org/)

[![Version-Number](https://img.shields.io/github/r-package/v/sportsdataverse/sportyR?label=sportyR&logo=R&style=for-the-badge)](https://github.com/sportsdataverse/sportyR)
[![R-CMD-check](https://img.shields.io/github/actions/workflow/status/sportsdataverse/sportyR/R-CMD-check.yaml?branch=main&label=R-CMD-Check&logo=R&logoColor=white&style=for-the-badge)](https://github.com/sportsdataverse/sportyR/actions/workflows/R-CMD-check.yaml)
[![CRAN
Status](https://img.shields.io/cran/v/sportyR?color=success&label=CRAN%20Version&logo=R&style=for-the-badge)](https://CRAN.R-project.org/package=sportyR)
[![CRAN
downloads](https://img.shields.io/badge/dynamic/json?style=for-the-badge&color=success&label=Downloads&query=%24%5B0%5D.downloads&url=https%3A%2F%2Fcranlogs.r-pkg.org%2Fdownloads%2Ftotal%2F2021-10-26%3Alast-day%2FsportyR)](https://CRAN.R-project.org/package=sportyR)

### [**`oddsapiR`**](https://oddsapiR.sportsdataverse.org/)

[![Version-Number](https://img.shields.io/github/r-package/v/sportsdataverse/oddsapiR?label=oddsapiR&logo=R&style=for-the-badge)](https://github.com/sportsdataverse/oddsapiR)
[![R-CMD-check](https://img.shields.io/github/actions/workflow/status/sportsdataverse/oddsapiR/R-CMD-check.yaml?branch=main&label=R-CMD-Check&logo=R&logoColor=white&style=for-the-badge)](https://github.com/sportsdataverse/oddsapiR/actions/workflows/R-CMD-check.yaml)
[![CRAN
Status](https://img.shields.io/cran/v/oddsapiR?color=success&label=CRAN%20Version&logo=R&style=for-the-badge)](https://CRAN.R-project.org/package=oddsapiR)
[![CRAN
downloads](https://img.shields.io/badge/dynamic/json?style=for-the-badge&color=success&label=Downloads&query=%24%5B0%5D.downloads&url=https%3A%2F%2Fcranlogs.r-pkg.org%2Fdownloads%2Ftotal%2F2021-10-26%3Alast-day%2FoddsapiR)](https://CRAN.R-project.org/package=oddsapiR)

## **Documentation**

- [Documentation website](https://r.sportsdataverse.org/)
- [Function
  reference](https://r.sportsdataverse.org/reference/index.html)
- [News and release
  notes](https://r.sportsdataverse.org/news/index.html)
- [sportsdataverse-R cheat sheet
  (PDF)](https://sportsdataverse.org/cheatsheets/sportsdataverse-R.pdf):
  a printable one-page reference covering the metapackage. Every
  SportsDataverse package has one — browse them all at
  [sportsdataverse.org/cheatsheets](https://sportsdataverse.org/cheatsheets).

## **Companion packages**

- [**`cfbplotR`**](https://cfbplotR.sportsdataverse.org/), for college
  football logo plots in `ggplot2`.
- [**`sdvplotR`**](https://sdvplotR.sportsdataverse.org/), for team logo
  plots in `ggplot2`, `gt` and `reactable` across the SportsDataverse
  leagues.
- [**`sdvmodels`**](https://sdvmodels.sportsdataverse.org/), for the
  fitted college football models that `cfbfastR` scores with.

## **The SportsDataverse**

[**`sportsdataverse`**](https://r.sportsdataverse.org/) is part of the
[SportsDataverse](https://sportsdataverse.org/), a set of open-source
packages for sports data.

| Package | Sport / Scope |
|----|----|
| [**cfbfastR**](https://cfbfastR.sportsdataverse.org/) | College football |
| [**hoopR**](https://hoopR.sportsdataverse.org/) | Men’s basketball (NBA and NCAA) |
| [**wehoop**](https://wehoop.sportsdataverse.org/) | Women’s basketball (WNBA and NCAA) |
| [**fastRhockey**](https://fastRhockey.sportsdataverse.org/) | Hockey (NHL and PWHL) |
| [**baseballr**](https://billpetti.github.io/baseballr/) | Baseball (MLB, MiLB, NCAA) |
| [**softballR**](https://github.com/sportsdataverse/softballR) | College softball |
| [**oddsapiR**](https://oddsapiR.sportsdataverse.org/) | Sports betting odds |
| [**recruitR**](https://recruitR.sportsdataverse.org/) | College football recruiting |
| [**usfootballR**](https://usfootballR.sportsdataverse.org/) | US soccer |
| [**cfbseedR**](https://cfbseedR.sportsdataverse.org/) · [**cfb4th**](https://cfb4th.sportsdataverse.org/) | CFB playoff simulation · fourth-down decisions |
| [**cfbplotR**](https://cfbplotR.sportsdataverse.org/) · [**sdvplotR**](https://sdvplotR.sportsdataverse.org/) · [**sportyR**](https://sportyR.sportsdataverse.org/) | Logos, colors, tables · playing surfaces |
| [**sportsdataverse-R**](https://r.sportsdataverse.org/) | Umbrella R metapackage |
| [**sportsdataverse-py**](https://py.sportsdataverse.org/) · [**sportsdataverse.js**](https://js.sportsdataverse.org/) | Python and Node.js |

See the full ecosystem at
[sportsdataverse.org](https://sportsdataverse.org/).

## **Follow the [SportsDataverse](https://x.com/SportsDataverse) on X and star this repo**

[![X
Follow](https://img.shields.io/twitter/follow/sportsdataverse?color=blue&label=%40sportsdataverse&logo=x&style=for-the-badge)](https://x.com/sportsdataverse)

[![GitHub
stars](https://img.shields.io/github/stars/sportsdataverse/sportsdataverse-R.svg?color=eee&logo=github&style=for-the-badge&label=Star%20sportsdataverse&maxAge=2592000)](https://github.com/sportsdataverse/sportsdataverse-R)

[![Star history of
sportsdataverse/sportsdataverse-R](https://raw.githubusercontent.com/sportsdataverse/sportsdataverse-R/star-history/star-history.png)](https://github.com/sportsdataverse/sportsdataverse-R)

## **Our Authors**

- [Saiem Gilani](https://x.com/saiemgilani)  
  [![@saiemgilani](https://img.shields.io/twitter/follow/saiemgilani?color=blue&label=%40saiemgilani&logo=x&style=for-the-badge)](https://x.com/saiemgilani)
  [![@saiemgilani](https://img.shields.io/github/followers/saiemgilani?color=eee&logo=Github&style=for-the-badge)](https://github.com/saiemgilani)

## **Cheat sheet**

A printable one-page reference for **`sportsdataverse`** — the
metapackage, its loaders, and the packages it attaches.

📄 **[Download the sportsdataverse-R cheat sheet
(PDF)](https://sportsdataverse.org/cheatsheets/sportsdataverse-R.pdf)**

Free to download, print and hand out; light and dark, US Letter
landscape. Every SportsDataverse package has one — browse them all at
**[sportsdataverse.org/cheatsheets](https://sportsdataverse.org/cheatsheets)**.

## **Citations**

To cite the [**`sportsdataverse`**](https://r.sportsdataverse.org) R
package in publications, use:

BibTeX Citation

``` bibtex
@misc{saiemgilani2021sdv,
  author = {Gilani, Saiem},
  title = {sportsdataverse: The Set of R Packages for Sports Data.},
  url = {https://r.sportsdataverse.org},
  year = {2026}
}
```

## **License**

[MIT](https://github.com/sportsdataverse/sportsdataverse-R/blob/main/LICENSE.md)
© Saiem Gilani. See
[LICENSE.md](https://github.com/sportsdataverse/sportsdataverse-R/blob/main/LICENSE.md).
