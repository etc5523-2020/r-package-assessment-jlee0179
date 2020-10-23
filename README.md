
<!-- README.md is generated from README.Rmd. Please edit that file -->

# covideu

<!-- badges: start -->

[![R build
status](https://github.com/etc5523-2020/r-package-assessment-jlee0179/workflows/R-CMD-check/badge.svg)](https://github.com/etc5523-2020/r-package-assessment-jlee0179/actions)
<!-- badges: end -->

The goal of covideu is to provide the main dataset used to create
COVID-19 in EU app, along with several datasets that had been processed
through data wrangling. In addition, three functions are developed to
enable simpler and easier coding process within
App.R.

## Installation

<!-- You can install the released version of covideu from [CRAN](https://CRAN.R-project.org) with: -->

<!-- ``` r -->

<!-- install.packages("covideu") -->

<!-- ``` -->

The development version can be installed from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("etc5523-2020/r-package-assessment-jlee0179")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(covideu)
#> Loading required package: shiny
library(tibble)
owid
#> # A tibble: 48,169 x 41
#>    iso_code continent location date       total_cases new_cases new_cases_smoot…
#>    <chr>    <chr>     <chr>    <date>           <dbl>     <dbl>            <dbl>
#>  1 ABW      North Am… Aruba    2020-03-13           2         2           NA    
#>  2 ABW      North Am… Aruba    2020-03-19          NA        NA            0.286
#>  3 ABW      North Am… Aruba    2020-03-20           4         2            0.286
#>  4 ABW      North Am… Aruba    2020-03-21          NA        NA            0.286
#>  5 ABW      North Am… Aruba    2020-03-22          NA        NA            0.286
#>  6 ABW      North Am… Aruba    2020-03-23          NA        NA            0.286
#>  7 ABW      North Am… Aruba    2020-03-24          12         8            1.43 
#>  8 ABW      North Am… Aruba    2020-03-25          17         5            2.14 
#>  9 ABW      North Am… Aruba    2020-03-26          19         2            2.43 
#> 10 ABW      North Am… Aruba    2020-03-27          28         9            3.43 
#> # … with 48,159 more rows, and 34 more variables: total_deaths <dbl>,
#> #   new_deaths <dbl>, new_deaths_smoothed <dbl>, total_cases_per_million <dbl>,
#> #   new_cases_per_million <dbl>, new_cases_smoothed_per_million <dbl>,
#> #   total_deaths_per_million <dbl>, new_deaths_per_million <dbl>,
#> #   new_deaths_smoothed_per_million <dbl>, new_tests <lgl>, total_tests <lgl>,
#> #   total_tests_per_thousand <lgl>, new_tests_per_thousand <lgl>,
#> #   new_tests_smoothed <lgl>, new_tests_smoothed_per_thousand <lgl>,
#> #   tests_per_case <lgl>, positive_rate <lgl>, tests_units <lgl>,
#> #   stringency_index <dbl>, population <dbl>, population_density <dbl>,
#> #   median_age <dbl>, aged_65_older <dbl>, aged_70_older <dbl>,
#> #   gdp_per_capita <dbl>, extreme_poverty <dbl>, cardiovasc_death_rate <dbl>,
#> #   diabetes_prevalence <dbl>, female_smokers <dbl>, male_smokers <dbl>,
#> #   handwashing_facilities <dbl>, hospital_beds_per_thousand <dbl>,
#> #   life_expectancy <dbl>, human_development_index <dbl>
```
