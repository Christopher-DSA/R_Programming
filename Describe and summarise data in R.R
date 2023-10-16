#Explore
#Clean
#Manipulate
#Describe and summarize
#Visualize
#Analyze

###############################
#   Describe and summarize  #
###############################


# Range / spread
# Centrality
# Variance
# Summarize your data
# Create tables

library(tidyverse)
data()
view(msleep)

#Have a quick look
glimpse(msleep)

#Describe the spread, centrality and variance of your variables
min(msleep$awake)
max(msleep$awake)
range(msleep$awake)
IQR(msleep$awake)
mean(msleep$awake)
var(msleep$awake)

#Shortcut way of doing some of this
summary(msleep) #will run this for every numeric variable
summary(msleep$awake)

#A third way of doing it (selecting the variables you want to summarize)
msleep %>% 
  select(sleep_total, brainwt) %>% 
  summary

# Create a summary table
## For each category of "vore",
## show the min, max, difference
## and average "sleep_total"
## and arrange data by the average

msleep %>% 
  filter(vore == "carni") %>% 
  select(name, vore, sleep_total) %>% 
  summary

msleep %>% 
  select(name, vore, sleep_total)

Summary_Table = msleep
#Making a new table
Summary_Table <- Summary_Table %>% 
  drop_na(vore) %>% 
  group_by(vore) %>% #apply summarize function per group (aggregation function like sql)
  summarise(Lower = min(sleep_total),
            Average = mean(sleep_total),
            Upper = max(sleep_total),
            Difference = 
            max(sleep_total)-min(sleep_total)) %>% 
  arrange(Average) 

#Groupby and summarize work together really well (bff's forever)


#Creating contingency tables
library(MASS)
attach(Cars93)

glimpse(Cars93)

#addmargins function
glimpse(Origin)
table(Origin)
table(AirBags, Origin)
addmargins(table(AirBags,Origin),1)

#prop.table() function
#Show proportions in percentages
table(AirBags,Origin)
#prop.table(table,rows or columns (1 or 2))
prop.table(table(AirBags, Origin),2) * 100
round(prop.table(table(AirBags,Origin) * 100,2))

glimpse(Cars93)

#The Tidyverse way of making a contingency table (comparing two variables)
Cars93 %>% 
  group_by(Origin, AirBags) %>% 
  summarise(number = n()) %>% 
  pivot_wider(names_from = Origin,
              values_from = number)

