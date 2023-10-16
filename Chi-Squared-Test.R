#Chi squared goodness of fit test

library(tidyverse)
library(forcats)
View(gss_cat)

#Selecting the Data
my_data <- gss_cat %>% 
  select(marital) %>% 
  filter(marital %in% c("Married",
                        "Never married",
                        "Divorced")) %>% 
  mutate(marital = fct_drop(marital))

#Table
my_table <- table(my_data)
View(my_table)
barplot(my_table)

#Use chi squared goodness of fit
#Apply chi squared test to a table()

#p value > 0.05 means the data has statistically equal proportions.
chisq.test(my_table)

#How to do all of this in one step using pipe operators.
my_data %>% 
  table() %>% 
  chisq.test()