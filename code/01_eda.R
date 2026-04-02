df <- read.csv("data/london_merged.csv")

str(df)
summary(df)

names(df)

summary(df[, c("cnt", "t1", "hum", "wind_speed")])

#Fig.1
hist(df$cnt,
     breaks = 40,
     main = "Distribution of Hourly Bike Rentals",
     xlab = "cnt")
#Fig.2
plot(df$t1, df$cnt,
     pch = 16, cex = 0.4,
     xlab = "Temperature (t1)",
     ylab = "Hourly Bike Rentals",
     main = "Temperature vs Bike Rentals")

#Fig.3
plot(df$hum, df$cnt,
     pch = 16, cex = 0.4,
     xlab = "Humidity",
     ylab = "Hourly Bike Rentals",
     main = "Humidity vs Bike Rentals")

#Fig.4
plot(df$wind_speed, df$cnt,
     pch = 16, cex = 0.4,
     xlab = "Wind Speed",
     ylab = "Hourly Bike Rentals",
     main = "Wind Speed vs Bike Rentals")

#Fig.5
boxplot(cnt ~ is_weekend,
        data = df,
        main = "Bike Rentals by Weekend Indicator",
        xlab = "is_weekend",
        ylab = "Hourly Bike Rentals")
