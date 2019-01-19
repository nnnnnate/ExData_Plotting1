
## read data from .txt
##  filter data with Date on 2007-02-01 or 2007-02-02
##  replace the Date and Time column w/ a new col named DateTime
powerData <- read.table("Project_1.txt", header = TRUE, sep = ";", na.strings = "?", as.is = TRUE)
powerData <- powerData[powerData$Date == "1/2/2007" | powerData$Date == "2/2/2007",]
DateTime <- paste(powerData$Date, powerData$Time, sep = " ")
powerData <- cbind(DateTime, powerData[,3:9])
powerData$DateTime <- strptime(powerData$DateTime, "%d/%m/%Y %H:%M:%S")


## plot2
png("plot2.png", height = 480, width = 480, units = "px")
plot(powerData$DateTime, powerData$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()