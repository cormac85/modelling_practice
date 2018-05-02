library(tidyverse)

df <-
  tribble(
  ~x, ~y, ~z1, ~a1,
  "a", 1, 0.1, 0.1,  
  "a", 2, 0.2, 0.1,
  "a", 4, 0.4, 0.1,
  "a", 8, 0.8, 0.1,
  "b", 1, 0.1, 0.1,
  "b", 2, 0.2, 0.1,
  "b", 3, 0.3, 0.1,
  "b", 4, 0.4, 0.1
  )

growth <- function(x) {(x / lag(x)) - 1}
abs_growth <- function(x) {x - lag(x)}


df %>% 
  group_by(x) %>% 
  mutate(y_growth = growth(y),
         y_abs_growth = abs_growth(y))

df %>% 
  group_by(x) %>% 
  mutate_at(
    .funs = funs(
      y_growth = (function(x){(x / lag(x)) - 1})(.),
      abs_growth = (function(x){(x - lag(x))})(.)
    ),
    .vars = vars(y))


df %>% 
  group_by(x) %>% 
  mutate_at(vars(contains("1")), 
            funs(growth = growth, abs_growth = abs_growth))