# The sportsdataverse logo, using ASCII or Unicode characters

Use
[`crayon::strip_style()`](http://r-lib.github.io/crayon/reference/strip_style.md)
to get rid of the colors.

## Usage

``` r
sportsdataverse_logo(unicode = l10n_info()$`UTF-8`)
```

## Arguments

- unicode:

  Whether to use Unicode symbols. Default is `TRUE` on UTF-8 platforms.

## Examples

``` r
sportsdataverse_logo()
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
