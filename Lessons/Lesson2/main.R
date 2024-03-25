# Ασκηση 2. Ανάλυση του dataset 'airquality'

### Ποιά είναι η μέση τιμή της θερμοκρασίας για τη δεδομένη περίοδο;

mean_temp <- mean(airquality$Temp)
cat("Η Μέση τιμή θερμοκρασίας είναι:", mean_temp, "Fahrenheit \n")

### Ποιά ημέρα ήταν η θερμότερη;
hotterst_day <- airquality$Day[which.max(airquality$Temp)]
hotterst_month <- airquality$Month[which.max(airquality$Temp)]
cat("Η ημέρα με την υψηλότερη θερμοκρασία ήταν η ", hotterst_day, "/", hotterst_month, "\n")


### Ποιά είχε τον πολύ αέρα;

windiest_day <- airquality$Day[which.max(airquality$Wind)]
windiest_month <- airquality$Month[which.max(airquality$Wind)]
cat("Η ημέρα με τον περισσότερο αέρα ήταν η", windiest_day, "/", windiest_month, "\n")


### Ποιές ημέρες η θερμοκρασία ήταν μεγαλύτερη από 90 βαθμούς Fahrenheit?
days_over_90 <- airquality$Day[which(airquality$Temp > 90)]
days_over_90_month <- airquality$Month[which(airquality$Temp > 90)]
for (i in 1:length(days_over_90)){
  cat(days_over_90[i], "/", days_over_90_month[i], ", ")
}

# Get basic statistics about temperature
temp_length <- length(airquality$Temp)

# Create a sequence of days for the time series plot
days <- seq(1, temp_length)

# Plot the time series of temperature
plot(days, airquality$Temp, xlab = "Day/Month - (0 = 1/5, 153 = 31/9)", ylab = "Temperature",main = "Temperature over Time")


# Create a boxplot of temperature
boxplot(airquality$Temp, main = "Temperature Distribution", ylab = "Temperature")

# Create a histogram of temperature
hist(airquality$Temp, main = "Temperature Histogram", xlab = "Temperature", ylab = "Frequency", col = "skyblue")


# calbulate the mean per month
avg_temp_per_month <- tapply(airquality$Temp, airquality$Month, mean)

# Sort average temperatures and months
sorted_avg_temp <- avg_temp_per_month[order(avg_temp_per_month)]

# Create a bar chart of average temperature per month
barplot(sorted_avg_temp, main = "Average Temperature per Month",
      xlab = "Month", ylab = "Average Temperature",
      col = rev(heat.colors(length(sorted_avg_temp))))
