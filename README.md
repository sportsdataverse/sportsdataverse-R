
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sportsdataverse <a href='https://saiemgilani.github.io/sportsdataverse-R/'><img src="https://raw.githubusercontent.com/saiemgilani/sportsdataverse-R/main/logo.png" align="right" width="20%" min-width="100px"/></a>

<!-- badges: start -->

[![Version-Number](https://img.shields.io/github/r-package/v/saiemgilani/sportsdataverse-R?label=sportsdataverse&logo=R&style=for-the-badge)](https://github.com/saiemgilani/sportsdataverse-R/)
[![R-CMD-check](https://img.shields.io/github/workflow/status/saiemgilani/sportsdataverse-R/R-CMD-check?label=R-CMD-Check&logo=R&logoColor=white&style=for-the-badge)](https://github.com/saiemgilani/sportsdataverse-R/actions/workflows/R-CMD-check.yaml)
[![Lifecycle:maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg?style=for-the-badge&logo=github)](https://github.com/saiemgilani/sportsdataverse-R/)
[![Twitter
Follow](https://img.shields.io/twitter/follow/sportsdataverse?color=blue&label=%40sportsdataverse&logo=twitter&style=for-the-badge)](https://twitter.com/sportsdataverse)
[![Contributors](https://img.shields.io/github/contributors/saiemgilani/sportsdataverse-R?style=for-the-badge)](https://github.com/saiemgilani/sportsdataverse-R/graphs/contributors)
<!-- badges: end -->

The [**`sportsdataverse`**](https://sportsdataverse.org) is a set of
sports data packages that work in harmony because they share common data
representations and API design. This package is designed to make it easy
to install and load multiple **`sportsdataverse`** packages in a single
step. Learn more about the **`sportsdataverse`** at
[sportsdataverse.org](https://sportsdataverse.org).

## Installation

You can install the released version of
[**`sportsdataverse`**](https://sportsdataverse.org) from
[GitHub](https://github.com/saiemgilani/sportsdataverse-R) with:

``` r
# You can install using the pacman package using the following code:
if (!requireNamespace('pacman', quietly = TRUE)){
  install.packages('pacman')
}
pacman::p_load_current_gh("saiemgilani/sportsdataverse-R")
```

``` r
# if you would prefer devtools installation
if (!requireNamespace('devtools', quietly = TRUE)){
  install.packages('devtools')
}
# Alternatively, using the devtools package:
devtools::install_github(repo = "saiemgilani/sportsdataverse-R")
```

``` r
sportsdataverse::sportsdataverse_logo()
#>                           __      
#>    _________  ____  _____/ /______
#>   / ___/ __ \/ __ \/ ___/ __/ ___/
#>  (__  / /_/ / /_/ / /  / /_(__  ) 
#> /____/ ____/\____/_/   \__/____/ 
#>     /_/_/ /___ _/ /_____ _ 
#>    / __  / __ `/ __/ __ `/
#>   / /_/ / /_/ / /_/ /_/ /
#>  _\_____\_____\___\_____\ 
#> | | / / _  /`__/ ___/ _ \ 
#> | |/ /  __/ / (__  /  __/
#> |___/\___/_/ /____/\___/
```

## Follow [**`sportsdataverse`**](https://twitter.com/sportsdataverse) on Twitter and star this repo

[![Twitter
Follow](https://img.shields.io/twitter/follow/sportsdataverse?color=blue&label=%40sportsdataverse&logo=twitter&style=for-the-badge)](https://twitter.com/sportsdataverse)

[![GitHub
stars](https://img.shields.io/github/stars/saiemgilani/sportsdataverse-R.svg?color=eee&logo=github&style=for-the-badge&label=Star%20sportsdataverse&maxAge=2592000)](https://github.com/saiemgilani/sportsdataverse-R/stargazers/)

## **Our Authors**

-   [Saiem Gilani](https://twitter.com/saiemgilani)  
    <a href="https://twitter.com/saiemgilani" target="blank"><img src="https://img.shields.io/twitter/follow/saiemgilani?color=blue&label=%40saiemgilani&logo=twitter&style=for-the-badge" alt="@saiemgilani" /></a>
    <a href="https://github.com/saiemgilani" target="blank"><img src="https://img.shields.io/github/followers/saiemgilani?color=eee&logo=Github&style=for-the-badge" alt="@saiemgilani" /></a>

## **Citations**

To cite the [**`sportsdataverse`**](https://sportsdataverse.org) R
package in publications, use:

BibTex Citation

``` bibtex
@misc{saiemgilani2021sdv,
  author = {Gilani, Saiem},
  title = {Sportsdataverse: The Set of R Packages for Sports Data.},
  url = {https://sportsdataverse.org},
  year = {2021}
}
```

## **R Packages in the SportsDataverse**

<a href='https://saiemgilani.github.io/cfbfastR/'><img src='https://raw.githubusercontent.com/saiemgilani/cfbfastR/master/logo.png' width="18%" min-width="100px" /></a>
<a href='https://hoopr.sportsdataverse.org/'><img src="https://hoopr.sportsdataverse.org/img/logo.png" width="18%" min-width="100px"/></a>
<a href='https://wehoop.sportsdataverse.org'><img src="https://wehoop.sportsdataverse.org/img/logo.png" width="18%" min-width="100px"/></a>
<a href='https://benhowell71.github.io/fastRhockey/'><img src='https://raw.githubusercontent.com/benhowell71/fastRhockey/main/logo.png' width="18%" min-width="100px" /></a>
<a href='https://jaseziv.github.io/worldfootballR/'><img src='https://raw.githubusercontent.com/saiemgilani/sportsdataverse-R/main/data-raw/worldfootballR-logo.png' width="18%" min-width="100px" /></a>

### [**`cfbfastR`**](https://saiemgilani.github.io/cfbfastR/)

[![Version-Number](https://img.shields.io/github/r-package/v/saiemgilani/cfbfastR?label=cfbfastR&logo=R&style=for-the-badge)](https://github.com/saiemgilani/cfbfastR)
[![R-CMD-check](https://img.shields.io/github/workflow/status/saiemgilani/cfbfastR/R-CMD-check?label=R-CMD-Check&logo=R&logoColor=white&style=for-the-badge)](https://github.com/saiemgilani/cfbfastR/actions/workflows/R-CMD-check.yaml)
[![CRAN
status](https://www.r-pkg.org/badges/version-last-release/cfbfastR?style=for-the-badge)](https://CRAN.R-project.org/package=cfbfastR)
[![CRAN
downloads](http://cranlogs.r-pkg.org/badges/grand-total/cfbfastR)](https://CRAN.R-project.org/package=cfbfastR)

### [**`hoopR`**](https://hoopr.sportsdataverse.org/)

[![Version-Number](https://img.shields.io/github/r-package/v/saiemgilani/hoopR?label=hoopR&logo=R&style=for-the-badge)](https://github.com/saiemgilani/hoopR)
[![R-CMD-check](https://img.shields.io/github/workflow/status/saiemgilani/hoopR/R-CMD-check?label=R-CMD-Check&logo=R&logoColor=white&style=for-the-badge)](https://github.com/saiemgilani/hoopR/actions/workflows/R-CMD-check.yaml)
[![CRAN
status](https://www.r-pkg.org/badges/version-last-release/hoopR?style=for-the-badge)](https://CRAN.R-project.org/package=hoopR)
[![CRAN
downloads](http://cranlogs.r-pkg.org/badges/grand-total/hoopR)](https://CRAN.R-project.org/package=hoopR)

### [**`wehoop`**](https://wehoop.sportsdataverse.org/)

[![Version-Number](https://img.shields.io/github/r-package/v/saiemgilani/wehoop?label=wehoop&logo=R&style=for-the-badge)](https://github.com/saiemgilani/wehoop)
[![R-CMD-check](https://img.shields.io/github/workflow/status/saiemgilani/wehoop/R-CMD-check?label=R-CMD-Check&logo=R&logoColor=white&style=for-the-badge)](https://github.com/saiemgilani/wehoop/actions/workflows/R-CMD-check.yaml)
[![CRAN
status](https://www.r-pkg.org/badges/version-last-release/wehoop?style=for-the-badge)](https://CRAN.R-project.org/package=wehoop)
[![CRAN
downloads](http://cranlogs.r-pkg.org/badges/grand-total/wehoop)](https://CRAN.R-project.org/package=wehoop)

### [**`fastRhockey`**](https://benhowell71.github.io/fastRhockey/)

[![Version-Number](https://img.shields.io/github/r-package/v/benhowell71/fastRhockey?label=fastRhockey&logo=R&style=for-the-badge)](https://github.com/benhowell71/fastRhockey)
[![R-CMD-check](https://img.shields.io/github/workflow/status/benhowell71/fastRhockey/R-CMD-check?label=R-CMD-Check&logo=R&logoColor=white&style=for-the-badge)](https://github.com/benhowell71/fastRhockey/actions/workflows/R-CMD-check.yaml)
[![CRAN
status](https://www.r-pkg.org/badges/version-last-release/fastRhockey?style=for-the-badge)](https://CRAN.R-project.org/package=fastRhockey)
[![CRAN
downloads](http://cranlogs.r-pkg.org/badges/grand-total/fastRhockey)](https://CRAN.R-project.org/package=fastRhockey)

### [**`worldfootballR`**](https://jaseziv.github.io/worldfootballR/)

[![Version-Number](https://img.shields.io/github/r-package/v/jaseziv/worldfootballR?label=worldfootballR&logo=R&style=for-the-badge)](https://github.com/jaseziv/worldfootballR)
[![R-CMD-check](https://img.shields.io/github/workflow/status/jaseziv/worldfootballR/R-CMD-check?label=R-CMD-Check&logo=R&logoColor=white&style=for-the-badge)](https://github.com/jaseziv/worldfootballR/actions/workflows/R-CMD-check.yaml)
[![CRAN
status](https://www.r-pkg.org/badges/version-last-release/worldfootballR?style=for-the-badge)](https://CRAN.R-project.org/package=worldfootballR)
[![CRAN
downloads](http://cranlogs.r-pkg.org/badges/grand-total/worldfootballR)](https://CRAN.R-project.org/package=worldfootballR)
