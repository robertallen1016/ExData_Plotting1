##Set working directory to directory where text file exists
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Create set of data that only includes the Global Active Power variable
globalactivepower <- as.numeric(subSetData$Global_active_power)

##Open png graphics device
png("plot1.png", width=480, height=480)

##Plot global active power to a histogram the will be created in the png graphics device
hist(globalactivepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

##Turn graphics device off
dev.off()