rm(list = ls())

# sqldf <- for efficient reading of tables
library(sqldf)

# lubridate <- for efficient work with dates and times
library(lubridate)

# Read data with only the required rows
data <- read.csv.sql("Data/household_power_consumption.txt", 
                     sql = "SELECT * from file WHERE Date in ('1/2/2007', '2/2/2007') ", 
                     sep = ";", 
                     header = TRUE)

# Combine dates and times in a new column
data$Date.Time <- paste(data$Date, data$Time, sep = " ")

# Transform Date.Time column using lubridate
data$Date.Time <- dmy_hms(data$Date.Time)

# Plot the time series
png(file = "ExData_Plotting1/plot3.png", bg = "transparent")
with(data, plot(Date.Time, Sub_metering_1, 
                type = "l",
                xlab = "",
                ylab = "Energy sub metering"))
with(data, lines(Date.Time, Sub_metering_2,
                 col = "red"))
with(data, lines(Date.Time, Sub_metering_3,
                 col = "blue"))
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1,1,1))
dev.off()