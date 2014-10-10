rm(list = ls())

# sqldf <- for efficient reading of tables
library(sqldf)

# Read data with only the required rows
data <- read.csv.sql("Data/household_power_consumption.txt", 
                     sql = "SELECT * from file WHERE Date in ('1/2/2007', '2/2/2007') ", 
                     sep = ";", 
                     header = TRUE)

# Plot the histogram
png(file = "ExData_Plotting1/plot1.png", bg = "transparent")
hist(data$Global_active_power, 
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()