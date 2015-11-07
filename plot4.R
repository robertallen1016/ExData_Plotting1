##Set working directory to directory where text file exists
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Create a varible that combines the date and time into one variable
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

globalactivepower <- as.numeric(subSetData$Global_active_power)
voltage <- as.numeric(subSetData$Voltage)
Meter1 <- as.numeric(subSetData$Sub_metering_1)
Meter2 <- as.numeric(subSetData$Sub_metering_2)
Meter3 <- as.numeric(subSetData$Sub_metering_3)
globalreactivepower <- as.numeric(subSetData$Global_reactive_power)

##Open png graphics device
png("plot4.png", width=480, height=480)

##Set graphic device to post four graphs in the same image
par(mfrow = c(2, 2)) 

##Graph 1
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

##Graph 2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

##Graph 3
plot(datetime, Meter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Meter2, type="l", col="red")
lines(datetime, Meter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

##Graph 4
plot(datetime, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")

##Turn graphics device off
dev.off()