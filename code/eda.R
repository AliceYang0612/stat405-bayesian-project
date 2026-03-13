df <- read.csv("../data/day.csv")

summary(df$cnt)
summary(df$temp)

hist(df$cnt, main="Distribution of Bike Rentals")

plot(df$temp, df$cnt,
     xlab="Temperature",
     ylab="Bike Rentals",
     main="Temperature vs Bike Rentals")
