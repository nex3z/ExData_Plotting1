# Plot 4
# Read data in the same directory
data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

# Subset data
selData <- subset(data, subset=(Date == "1/2/2007" | Date == "2/2/2007"))
# Convert time
rawTimeInfo <- paste(selData$Date, selData$Time)
timeInfo <- as.POSIXct(strptime(rawTimeInfo, "%d/%m/%Y %H:%M:%S"))

# Plot
opar <- par(no.readonly=TRUE)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(selData$Global_active_power~timeInfo, type="l", ylab="Global Active Power (kilowatts)", xlab="")

plot(selData$Voltage~timeInfo, type="l", ylab="Voltage (volt)", xlab="")

plot(selData$Sub_metering_1~timeInfo, type="l", ylab="Global Active Power (kilowatts)", xlab="")
lines(selData$Sub_metering_2~timeInfo,col='Red')
lines(selData$Sub_metering_3~timeInfo,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(selData$Global_reactive_power~timeInfo, type="l", ylab="Global Rective Power (kilowatts)",xlab="")

par(opar)

# Save file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()