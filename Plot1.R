setwd("~/Coursera Data Science/EDA/Assignment 1")
library(dplyr)
## Read table into variable:  
electric <- read.table(file="household_power_consumption.txt", header= TRUE, sep = ";", na.strings = "?")
electricnames <- electric[1,1:9]
electric2 <- filter(electric, Date == "1/2/2007" | Date == "2/2/2007" )
with(electric2, hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power"))
dev.copy(png, file ="plot1.png")  
dev.off()  
