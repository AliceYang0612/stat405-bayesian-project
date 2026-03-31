df <- read.csv("data/london_merged.csv")

str(df)
summary(df)

names(df)

summary(df[, c("cnt", "t1", "hum", "wind_speed")])

hist(df$cnt,
     breaks = 40,
     main = "Distribution of Hourly Bike Rentals",
     xlab = "cnt")

plot(df$t1, df$cnt,
     pch = 16, cex = 0.4,
     xlab = "Temperature (t1)",
     ylab = "Hourly Bike Rentals",
     main = "Temperature vs Bike Rentals")

plot(df$hum, df$cnt,
     pch = 16, cex = 0.4,
     xlab = "Humidity",
     ylab = "Hourly Bike Rentals",
     main = "Humidity vs Bike Rentals")

plot(df$wind_speed, df$cnt,
     pch = 16, cex = 0.4,
     xlab = "Wind Speed",
     ylab = "Hourly Bike Rentals",
     main = "Wind Speed vs Bike Rentals")

boxplot(cnt ~ is_weekend,
        data = df,
        main = "Bike Rentals by Weekend Indicator",
        xlab = "is_weekend",
        ylab = "Hourly Bike Rentals")
