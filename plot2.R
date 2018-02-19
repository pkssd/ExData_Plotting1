#Set the current directory
setwd("C:/Coursera/R")

#Read the data from household_power_consumption.txt file
householdData <- read.csv("./household/household_power_consumption.txt", header=T, sep=';', na.strings="?")


# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
# Subset of Data
householdSubset <- subset(householdData, Date %in% c("1/2/2007","2/2/2007"))

# change class of all columns to correct class
hdate <- as.Date(householdSubset$Date, format="%d/%m/%Y")
globalActivePower <- as.numeric(householdSubset$Global_active_power)

# Combine Date and Time 
datetime <- paste(as.Date(hdate), householdSubset$Time)
householdSubset$Datetime <- as.POSIXct(datetime)

## Plot2 - globalactivepower vs date&time
png("./household/plot2.png", width=480, height=480)

with(householdSubset, plot(globalActivePower~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

dev.off()

