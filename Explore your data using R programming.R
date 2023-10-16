# Explore
# Clean
# Manipulate
# Describe
# Visualize
# Analyse

library(tidyverse)
data()
?starwars
#dimensions function
dim(starwars)
#structure function that seems like string
str(starwars)
#glimpse function? usually better than the str() function for the same purpose, comes with the tidyverse package
glimpse(starwars)
#brings up data set in a new window
View(starwars)
#comment
head(starwars)
#comment
tail(starwars)

#to look at a particular variable
starwars$name

attach(starwars)

#This function gives you the names of all variables in the dataframe
names(starwars)
#In this case tells you how many variables there are
length(starwars)
#class tells you the type of the variable
class(hair_color)
#Tells you the number of observations for a particular variable
length(hair_color)
#Shows you all distinct values for a specific variable
unique(hair_color)

#shows counts of each observation
table(hair_color)
#Now sorting the table
sort(table(hair_color))
#Same as the above just pops it into a new window
View(sort(table(hair_color), decreasing = TRUE))
#Same as above but now it's a plot
barplot(sort(table(hair_color), decreasing = TRUE))

#plot
barplot(sort(table(eye_color), decreasing = TRUE))


#Doing this with tidyverse

starwars %>% 
  select(hair_color) %>% 
  count(hair_color) %>% 
  arrange(desc(n)) %>% 
  View()

#showing just rows where hair color is na and showing all variables
View(starwars[is.na(hair_color),])

#Dealing with numeric variable
class(height)
length(height)
#Seeing counts of unique height observations
View(sort(table(height), decreasing = TRUE))
#kdsajfl summary also shows how many missing values there is which is quite useful
summary(height)
#plots
boxplot(height)
#Is the distributions normal? determines what kind of statistical functions can be applied to the data
hist(height)

