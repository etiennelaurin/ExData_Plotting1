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
png(file="plot4.png")

# Create a two-by-two matrix for plots
par(mfcol = c(2, 2))

# Add the plot for Global active power by date time
plot(epcData$DateTime, epcData$Global_active_power, xlab="", ylab="Global Active Power", type="o", pch=NA)

# Add the plot for the first sub metering by date time in black
plot(epcData$DateTime, epcData$Sub_metering_1, type="o", pch=NA, col="black", xlab="", ylab="Energy sub metering")

# Add the points for the second sub metering by date time in red
points(epcData$DateTime, epcData$Sub_metering_2, type="o", pch=NA, col="red")

# Add the points for the third sub metering by date time in blue
points(epcData$DateTime, epcData$Sub_metering_3, type="o", pch=NA, col="blue")

# Add a legend in the top right corner
legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Add the plot for Voltage by date time
plot(epcData$DateTime, epcData$Voltage, xlab="datetime", ylab="Voltage", type="o", pch=NA)

# Add the plot for Global reactive power by date time
plot(epcData$DateTime, epcData$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="o", pch=NA)

# Save the PNG
dev.off()
