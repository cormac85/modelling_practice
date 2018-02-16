# Challenges from https://www.analyticsvidhya.com/blog/2016/06/9-challenges-data-merging-subsetting-r-python-beginner/

library(tidyverse)

# Challenge 1
house <- readxl::read_xls("./data/Challenges/Challenge 1 _ Adding more Observations.xls",
                            1)
house_extra <- readxl::read_xls("./data/Challenges/Challenge 1 _ Adding more Observations.xls",
                          2)

summary(house %>% map_df(as.factor))
summary(house_extra%>% map_df(as.factor))

house_all <- rbind(house, house_extra)

rm(house, house_extra)

# Challenge 2 
candidates <- readxl::read_xls("./data/Challenges/Challenge 2 _ Dropping Observations.xls",
                          1)
candidates[3:nrow(candidates), ]
invitations <- candidates %>% filter(Name != "Robb Stark")
invitations
rm(candidates)

candidates <- readxl::read_xls("./data/Challenges/Challenge 2 _ Dropping Observations.xls",
                               1)