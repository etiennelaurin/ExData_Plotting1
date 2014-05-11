# Add the PNG library for output
library(png)

# Set the locale
Sys.setlocale(locale = "C")

# Read the data
epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Convert dates as dates
epc$DateAsDate <- as.Date(epc$Date, format="%d/%m/%Y")

# Extract the data for 2007-02-01 and 2007-02-02
epcData <- subset(epc, epc$DateAsDate >= as.Date("2007-02-01") & epc$DateAsDate <= as.Date("2007-02-02"))

# Create the PNG file
png(file="plot1.png")

# Add the histogram for Global active power
hist(epcData$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

# Save the PNG
dev.off()
