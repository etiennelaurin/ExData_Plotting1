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
png(file="plot2.png")

# Add the plot for Global active power by date time
plot(epcData$DateTime, epcData$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="o", pch=NA)

# Save the PNG
dev.off()
