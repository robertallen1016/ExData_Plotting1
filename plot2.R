##Set working directory to directory where text file exists
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Create a varible that combines the date and time into one variable
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##Create set of data that only includes the Global Active Power variable
globalactivepower <- as.numeric(subSetData$Global_active_power)

##Open png graphics device
png("plot2.png", width=480, height=480)

##Plot the date and time in global active power that will be created in the png graphics device
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

##Turn graphics device off
dev.off()