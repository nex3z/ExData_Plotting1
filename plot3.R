# Plot 3
# Read data in the same directory
data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

# Subset data
selData <- subset(data, subset=(Date == "1/2/2007" | Date == "2/2/2007"))
# Convert time
rawTimeInfo <- paste(selData$Date, selData$Time)
timeInfo <- as.POSIXct(strptime(rawTimeInfo, "%d/%m/%Y %H:%M:%S"))

# Plot
plot(selData$Sub_metering_1~timeInfo, type="l", xlab="", ylab="Global Active Power (kilowatts)")
lines(selData$Sub_metering_2~timeInfo, col='Red')
lines(selData$Sub_metering_3~timeInfo, col='Blue')

legend("topright", col=c("black", "red", "blue"), lty=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()