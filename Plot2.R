setwd("~/Coursera Data Science/EDA/Assignment 1")
library(dplyr)
## Read table into variable:  
electric <- read.table(file="household_power_consumption.txt", header= TRUE, sep = ";", na.strings = "?")
electricnames <- electric[1,1:9]
electric2 <- filter(electric, Date == "1/2/2007" | Date == "2/2/2007" )
electric2$DateTime <- strptime(paste(electric2$Date, electric2$Time), "%d/%m/%Y %H:%M") 
electric2$day <- weekdays(as.Date(electric2$Date))
with(electric2, plot(DateTime, Global_active_power, type="l", xlab=" ", ylab="Global Active Power (kilowatts)"))
dev.copy(png, file ="plot2.png")  
dev.off()  
