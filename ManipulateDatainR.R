#Manipulate
#Rename a Variable
#Change a Variable type
#Select variables to work with
#Filter and arrange data
#Recode data
#Change data (mutate)
#Conditions changes (if_else)
#Reshape dataframe
  #wide to long
  #long to wide

# load packages
library(tidyverse)
library(dplyr)
#data() to see all datasets available to practice with

# view data
?msleep
glimpse(msleep)
View(msleep)

# Rename a variable

msleep

msleep %>% 
  #rename(newname,oldname)
  rename("conserv" = "conservation")
  glimpse()
  
# reorder variables (showing certain vars first)
msleep %>% 
  select(vore,name,everything())

#Change a variable type
class(msleep$vore)
glimpse(msleep)

#Changing vore to a factor from chr
msleep$vore <- as.factor(msleep$vore)

glimpse(msleep)

#How to do the same thing but now with the tidyverse
msleep %>% 
  mutate(vore = as.character(vore)) %>% 
  glimpse()

#select what variables to work with

names(msleep)

#Tips and tricks
msleep %>% 
  select(2:4,
         awake,
         starts_with("sleep"),
         contains("wt")) %>% 
  names()

#Filter and arrange data
unique(msleep$order)

#Filtering by sleep_total and order of species variable
msleep %>% 
  filter((order == "Carnivora" |
          order == "Primates") &
           sleep_total > 8) %>% 
  select(name, order, sleep_total) %>% 
  arrange(-sleep_total) %>% 
  View()

msleep %>% 
  filter(order %in% c("Carnivora", "Primates") &
           sleep_total > 8) %>% 
  select(name, order, sleep_total) %>% 
  arrange(-sleep_total) %>% 
  View()

#change observations (mutate)
msleep %>% 
  #Converting brainwt to Grams instead of Kg
  mutate(brainwt = brainwt * 1000) %>% 
  View
 
msleep %>%
  #Making a new column in gramse ALONGSIDE the old brainwt column
  mutate(brainwt_in_grams = brainwt * 1000) %>% 
  View()

#conditional changes (if_else)
## logical vector based on a condition

#Let's say we ask R a 'question'
msleep$brainwt > 0.01

#Important R tech
size_of_brain <- msleep %>% 
  select(name, brainwt) %>% 
  drop_na(brainwt) %>% 
  mutate(brain_size = if_else(brainwt > 0.01,
                              "large",
                              "small"))

size_of_brain

# Recode data and rename a variable
## Change observations of "large" and "small" into 1 and 2
#good for classification tasks? 1 and 2.
size_of_brain %>% 
  mutate(brain_size = recode(brain_size,
                             "large" = 1,
                             "small" = 2))
library(gapminder)
View(gapminder)

#Creating a new object called "data"
data <- select(gapminder, country, year, lifeExp)

View(data)

wide_data <- data %>% 
  pivot_wider(names_from = year, values_from = lifeExp)

long_data <- wide_data %>% 
  pivot_longer(2:13,
               names_to = "year",
               values_to = "lifeExp")
