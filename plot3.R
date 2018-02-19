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


# change class of all columns to correct class
subMetering1 <- as.numeric(householdSubset$Sub_metering_1)
subMetering2 <- as.numeric(householdSubset$Sub_metering_2)
subMetering3 <- as.numeric(householdSubset$Sub_metering_3)



## Plot3 - globalactivepower vs date&time
png("./household/plot3.png", width=480, height=480)

with(householdSubset, {
  plot(subMetering1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(subMetering2~Datetime,col='Red')
  lines(subMetering3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
























