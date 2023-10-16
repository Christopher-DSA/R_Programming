my_age <- 21
your_age <- 65
sum(my_age,your_age)
my_cars <- cars

plot(cars)
hist(cars$speed)
attach(cars)
hist(dist)
summary(cars)

class(cars)
class(cars$speed)
length(cars$speed)
unique(cars$speed)
head(cars)
tail(cars)
subset <- cars[3:6 , 1:2]

?median

median(cars$dist)

new_data <- c(2,4,6,3,NA,9)
median(new_data, na.rm = TRUE) #comment
