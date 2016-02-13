setwd("~/Coursera Data Science/EDA/Assignment 1")
library(dplyr)
## Read table into variable:  
electric <- read.table(file="household_power_consumption.txt", header= TRUE, sep = ";", na.strings = "?")
electricnames <- electric[1,1:9]
electric2 <- filter(electric, Date == "1/2/2007" | Date == "2/2/2007" )
electric2$DateTime <- strptime(paste(electric2$Date, electric2$Time), "%d/%m/%Y %H:%M") 
electric2$day <- weekdays(as.Date(electric2$Date))
par(mfrow =c(2,2))
#
with(electric2, plot(DateTime, Global_active_power, type="l", xlab=" ", ylab="Global Active Power"))
#
with(electric2, plot(DateTime, Voltage, type="l", ylab="Voltage"))
#
with(electric2, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering"))
with(electric2, lines(DateTime, Sub_metering_2, col = "red", type="l"))
with(electric2, lines(DateTime, Sub_metering_3, col = "blue", type="l"))
legend("topright", pch = "____", col = c("black","blue","red"), legend = c("Sub Metering 1","Sub Metering 2","Sub Metering 3"))
#
with(electric2, plot(DateTime, Global_reactive_power, type="l", ylab="Global Reactive Power"))
dev.copy(png, file ="plot4.png")  
dev.off()  