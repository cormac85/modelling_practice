#' ---
#' output:
#'   md_document:
#'     variant: markdown_github
#' ---
#+ reprex-setup, include = FALSE
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", error = TRUE)
knitr::opts_knit$set(upload.fun = knitr::imgur_upload)


#+ reprex-body
# https://www.reddit.com/r/rstats/comments/9vnmy5/apply_operations_to_every_observation_in_a_group/
library(dplyr)

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



