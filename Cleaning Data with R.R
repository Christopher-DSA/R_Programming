#Clean


###########################
########CLEANING DATA######
###########################

#What is clean data?
# Variable types are correct
# Select and filter
# Find and deal with missing data
# Find and deal with duplicates
# Recording values

#packages
library(tidyverse)
View(starwars)

#Variable types

glimpse(starwars)
class(starwars$gender)
unique(starwars$gender)

#Changing the type of a variable
starwars$gender <- as.factor(starwars$gender)
class(starwars$gender)

levels(starwars$gender)

#Swapping the order of the levels
starwars$gender <- factor((starwars$gender),
                          levels = c("masculine","feminine"))
levels(starwars$gender)

#Select variables

names(starwars) #shows the names of all variables in dataframe. "Column names".

#Selecting a new data frame
starwars %>% 
  select(name,height, ends_with("color"))

#filter observations
unique(starwars$hair_color)

starwars %>% 
  select(name,height,ends_with("color")) %>% 
  filter(hair_color %in% c("blond", "brown") &
  height < 180)

# Missing Data

mean(starwars$height, na.rm = TRUE)

#Not recommended to na.omit() but this is how it is done.
starwars %>% 
  select(name,gender,hair_color,height) %>% 
  na.omit()

#Step 1: Find out Where the "missingness" actually is
starwars %>% 
  select(name, gender, hair_color, height) %>% 
  filter(!complete.cases(.)) #Filtering out all cases that have complete data (no n/a)

#Step 2: Delete observations where it is appropiate
starwars %>% 
  select(name,gender,hair_color,height) %>% 
  filter(complete.cases(.)) %>% #show all cases with condition met
  drop_na(height) %>% 
  view()

#Step 3: Replace data (n/a with something else)
starwars %>% 
  select(name,gender,hair_color,height) %>% 
  filter(!complete.cases(.)) %>% 
  mutate(hair_color = replace_na(hair_color, "none"))

#Duplicates

Names <- c ("Peter", "John", "Andrew", "Peter")
Age <- c(22,33,44,22)


friends <- data.frame(Names,Age)

#How to discover duplicates in the first place
friends[!duplicated(friends),]

#Then how to, De-dupe duplicate rows
friends %>% distinct() %>% 
  View()

# Re-coding Variables
starwars %>% select(name,gender) %>% 
  mutate(gender_coded = recode(gender, 
                         "masculine" = 1, 
                         "feminine" = 2)) %>% 
view()
