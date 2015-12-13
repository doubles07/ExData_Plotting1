# Set working directory
setwd("../")
# Download file and read data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./data.zip", method = "curl")
powerData <- read.table(unz("data.zip", "data.txt"), header=T, sep=";", na.strings="?")

# Subset data for Feb. 1 and 2, 2007 only
data <- powerData[as.character(powerData$Date) %in% c("2007-02-01", "2007-02-02"),]

# Convert to Date/Time
dateTime <- paste(data$Date, data$Time)
data$dateTime <- as.POSIXct(dateTime)
attach(data)

# Plot the distribution of global active power
png("plot1.png", width=480, height=480, units="px")
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()