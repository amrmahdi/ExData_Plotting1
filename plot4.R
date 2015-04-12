library(lubridate)

powerConsumption <- read.csv("household_power_consumtion.txt", sep=";", na.strings = c("?"), colClasses = c(rep("character", 2), rep("numeric", 7)), header=TRUE)
powerConsumption$Date <- dmy(powerConsumption$Date)
powerConsumption$Time <- hms(powerConsumption$Time)

powerConsumption$Time <- powerConsumption$Date + powerConsumption$Time

start <- dmy("01-02-2007")
end <- dmy("02-02-2007")

powerConsumption <- subset(powerConsumption, powerConsumption$Date >= start & powerConsumption$Date <= end)

png(filename='plot4.png')

par(mfrow=c(2,2))

plot(powerConsumption$Time, powerConsumption$Global_active_power, xlab = "", ylab = "Global Active Power", type = 'l')

plot(powerConsumption$Time, powerConsumption$Voltage, xlab = "datetime", ylab = "Voltage", type = 'l')


plot(powerConsumption$Time, powerConsumption$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = 'l')
lines(powerConsumption$Time, powerConsumption$Sub_metering_2,  col="red")
lines(powerConsumption$Time, powerConsumption$Sub_metering_3,  col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = "solid")

plot(powerConsumption$Time, powerConsumption$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = 'l')

dev.off()