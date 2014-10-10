rm(list = ls())

library(sqldf)
data <- read.csv.sql("Data/household_power_consumption.txt", 
                     sql = "SELECT * from file WHERE Date in ('1/2/2007', '2/2/2007') ", 
                     sep = ";", 
                     header = TRUE)

png(file = "ExData_Plotting1/plot1.png", bg = "transparent")
hist(data$Global_active_power, 
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()