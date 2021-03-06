library(lubridate)

powerConsumption <- read.csv("household_power_consumtion.txt", sep=";", na.strings = c("?"), colClasses = c(rep("character", 2), rep("numeric", 7)), header=TRUE)
powerConsumption$Date <- dmy(powerConsumption$Date)
powerConsumption$Time <- hms(powerConsumption$Time)

powerConsumption$Time <- powerConsumption$Date + powerConsumption$Time

start <- dmy("01-02-2007")
end <- dmy("02-02-2007")

powerConsumption <- subset(powerConsumption, powerConsumption$Date >= start & powerConsumption$Date <= end)

png(filename='plot1.png')

hist(powerConsumption$Global_active_power, main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red')

dev.off()