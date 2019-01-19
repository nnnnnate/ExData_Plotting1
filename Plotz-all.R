
## read data from .txt
##  filter data with Date on 2007-02-01 or 2007-02-02
##  replace the Date and Time column w/ a new col named DateTime
powerData <- read.table("Project_1.txt", header = TRUE, sep = ";", na.strings = "?", as.is = TRUE)
powerData <- powerData[powerData$Date == "1/2/2007" | powerData$Date == "2/2/2007",]
DateTime <- paste(powerData$Date, powerData$Time, sep = " ")
powerData <- cbind(DateTime, powerData[,3:9])
powerData$DateTime <- strptime(powerData$DateTime, "%d/%m/%Y %H:%M:%S")

## plot1
png("plot1.png", height = 480, width = 480, units = "px")
hist(powerData$Global_active_power,  breaks = 12, 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", main = "Global Active Power",
     col = "red")
dev.off()

## plot2
png("plot2.png", height = 480, width = 480, units = "px")
plot(powerData$DateTime, powerData$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

## plot3
png("plot3.png", height = 480, width = 480, units = "px")
plot(powerData$DateTime, powerData$Sub_metering_1, type = "n",
     xlab = "", ylab = "Energy Sub metering")
lines(powerData$DateTime, powerData$Sub_metering_1, col = "black")
lines(powerData$DateTime, powerData$Sub_metering_2, col = "red")
lines(powerData$DateTime, powerData$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()

## plot4
png("plot4.png", height = 480, width = 480, units = "px")
par(mfrow = c(2, 2))
plot(powerData$DateTime, powerData$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
plot(powerData$DateTime, powerData$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")
plot(powerData$DateTime, powerData$Sub_metering_1, type = "n",
     xlab = "", ylab = "Energy Sub metering")
lines(powerData$DateTime, powerData$Sub_metering_1, col = "black")
lines(powerData$DateTime, powerData$Sub_metering_2, col = "red")
lines(powerData$DateTime, powerData$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
plot(powerData$DateTime, powerData$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()