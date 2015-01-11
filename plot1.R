# Read data in the same directory
data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
# Convert data format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset data
selData <- subset(data, subset=(Date == "2007-02-01" | Date == "2007-02-02"))

# Plot histogram
hist(selData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", col="Red", xlim=c(0, 6), ylim=c(0, 1200))

# Save file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
