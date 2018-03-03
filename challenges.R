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

# Challenge 3 : Adding Column(s) Horizontally
house <- readxl::read_xls("./data/Challenges/Challenge 3 _ Adding Column(s) Horizontally.xls",
                               1) %>% 
  cbind(readxl::read_xls("./data/Challenges/Challenge 3 _ Adding Column(s) Horizontally.xls",
                            2)
  )

# Challenge 4: Adding Column(s) based on common attribute
house %>% left_join(candidates) %>% 
  top_n(1, Military_Strength)
# Question : List the houses that have atleast one heir?
house %>% left_join(candidates) %>%
  filter(!is.na(Name))
# Question : List all the available information about houses and heirs?
house %>% dplyr::full_join(candidates)

# Challenge 5 : Adding Column(s) based on observation serial (index)
# This was so badly worded I actually don't know what they want...

house_5 <- readxl::read_xls("./data/Challenges/Challenge 5 _ Adding Column(s) based on observation serial (index).xls",
                            1) %>% 
  filter(!is.na(Name)) %>% 
  rename(house = X__1)

candidates_5 <- 
  readxl::read_xls("./data/Challenges/Challenge 5 _ Adding Column(s) based on observation serial (index).xls",
                 2) %>% 
filter(!is.na(Military_Strength)) %>% 
  rename(house = X__1)

house_5 %>% left_join(candidates_5)

# Challenge 6: Removing Duplicate Observations
house_6 <- readxl::read_xls("./data/Challenges/Challenge 6_ Removing Duplicate observations.xls",
                            1)

candidate_6 <- readxl::read_xls("./data/Challenges/Challenge 6_ Removing Duplicate observations.xls",
                            2) %>% 
  mutate(Eldest = c(T, T, F, F, T, T, T))

candidate_6 %>% 
  filter(Eldest==TRUE) %>% 
  right_join(house_6)

# Challenge 7: Dropping Columns

house_7 <- readxl::read_xls("./data/Challenges/Challenge 7_ Dropping Columns.xls",
                            1)

house_7 %>% select(-Region_right)

# Challenge 8: Modifying Value(s) of a DataFrame

house_8 <- readxl::read_xls("./data/Challenges/Challenge 8_ Modifying Value(s) of a DataFrame.xls",
                            1)

house_8[house_8$Name=="Arya Stark", ]$Region_left <- "North"

house_8 %>% 
  mutate(Region_left =
           if_else(Region_left == "Westros", "Kings Landing", Region_left))

# Challenge 9: Renaming Column Name(s)

house_9 <- readxl::read_xls("./data/Challenges/Challenge 9_ Renaming Column Name(s).xls",
                            1)

house_9 %>% rename(Region = Region_left)