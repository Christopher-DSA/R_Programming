#Chicken weight explained by feed plot.

chick_data <- chickwts

chick_data %>%
  group_by(feed) %>% 
  ggplot(aes(x = weight,
             y = feed,
             size = weight,
             color = feed))+
  geom_point(alpha = 0.5) +
  
  # Add mean points
  stat_summary(
    fun = "mean",
    geom = "point",
    aes(size = 400),
    color = "red"
  ) +
  #Title
  labs(title="Chicken weight explained by feed",
       x = "Weight of chickens",
       y = "Feed"
  )