``` r
# https://www.reddit.com/r/rstats/comments/9vnmy5/apply_operations_to_every_observation_in_a_group/
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union

df1 <- dplyr::tibble(
  ED = c('a', 'b', 'b', 'b' , 'a', 'a'),
  YEAR = c(2017, 2017, 2017, 2018, 2018, 2018),
  Gender = c(1, 0, 1, 0, 1, 0),
  Wage = c(NA, 1000, 2000, NA, 2000, 1000)
)

df1 %>%
  mutate(gender1Wage = case_when(
    Gender == 1 ~ Wage,
    TRUE ~ NA_real_
  ),
  gender1Wage = case_when(
    is.na(gender1Wage) ~ 0,
    TRUE ~ gender1Wage)) %>%
  group_by(ED, YEAR) %>%
  mutate(meanWage = mean(gender1Wage))
#> # A tibble: 6 x 6
#> # Groups:   ED, YEAR [4]
#>   ED     YEAR Gender  Wage gender1Wage meanWage
#>   <chr> <dbl>  <dbl> <dbl>       <dbl>    <dbl>
#> 1 a      2017      1    NA           0        0
#> 2 b      2017      0  1000           0     1000
#> 3 b      2017      1  2000        2000     1000
#> 4 b      2018      0    NA           0        0
#> 5 a      2018      1  2000        2000     1000
#> 6 a      2018      0  1000           0     1000
```
