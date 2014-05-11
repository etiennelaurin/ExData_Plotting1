# Add the PNG library for output
library(png)

# Set the locale
Sys.setlocale(locale = "C")

# Read the data
epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Convert dates as dates
epc$DateAsDate <- as.Date(epc$Date, format="%d/%m/%Y")

# Convert dates and times as dates and times
epc$DateTime <- as.POSIXct(paste(epc$DateAsDate, epc$Time), format="%Y-%m-%d %H:%M:%S")

# Extract the data for 2007-02-01 and 2007-02-02
epcData <- subset(epc, epc$DateAsDate >= as.Date("2007-02-01") & epc$DateAsDate <= as.Date("2007-02-02"))

# Create the PNG file
png(file="plot3.png")

# Add the plot for the first sub metering by date time in black
plot(epcData$DateTime, epcData$Sub_metering_1, type="o", pch=NA, col="black", xlab="", ylab="Energy sub metering")

# Add the points for the second sub metering by date time in red
points(epcData$DateTime, epcData$Sub_metering_2, type="o", pch=NA, col="red")

# Add the points for the third sub metering by date time in blue
points(epcData$DateTime, epcData$Sub_metering_3, type="o", pch=NA, col="blue")

# Add a legend in the top right corner
legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save the PNG
dev.off()
