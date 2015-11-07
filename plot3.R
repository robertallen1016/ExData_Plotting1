##Set working directory to directory where text file exists
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Create a varible that combines the date and time into one variable
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##Create three variables for plotting relating to the three submetering variables in original data
Meter1 <- as.numeric(subSetData$Sub_metering_1)
Meter2 <- as.numeric(subSetData$Sub_metering_2)
Meter3 <- as.numeric(subSetData$Sub_metering_3)

##Open png graphics device
png("plot3.png", width=480, height=480)

##Plot the three submetering variables seperately and add a legend
plot(datetime, Meter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Meter2, type="l", col="red")
lines(datetime, Meter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

##Turn graphics device off
dev.off()