# Plot 2
# Read data in the same directory
data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

# Subset data
selData <- subset(data, subset=(Date == "1/2/2007" | Date == "2/2/2007"))
# Convert time
rawTimeInfo <- paste(selData$Date, selData$Time)
timeInfo <- as.POSIXct(strptime(rawTimeInfo, "%d/%m/%Y %H:%M:%S"))

# Plot
plot(selData$Global_active_power~timeInfo, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Save file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()