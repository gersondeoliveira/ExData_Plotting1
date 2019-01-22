setwd ("C:/Users/gerson/Desktop/DOST/exdata_data_household_power_consumption")

#Load dataset
data <- read.table("C:/Users/tydani/Desktop/DOST/exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Convert the date variable in date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Use only the data between '2007-01-01' and '2007-02-02'
data_in_use <- subset(data, Date <= "2007-02-02" & Date >= "2007-02-01")

#Convert dates and times
datetime <- strptime(paste(data_in_use$Date, data_in_use$Time), "%Y-%m-%d %H:%M:%S")

#Creating the global active power, voltage, submetering, and global reactive power
globalActivePower <- as.numeric(data_in_use$Global_active_power)
voltage <- as.numeric(data_in_use$Voltage)
subMetering1 <- as.numeric(data_in_use$Sub_metering_1)
subMetering2 <- as.numeric(data_in_use$Sub_metering_2)
subMetering3 <- as.numeric(data_in_use$Sub_metering_3)
globalReactivePower <- as.numeric(data_in_use$Global_reactive_power)

#Create a plot
png("plot4.png", width=480, height=480)

#For the arrangement of the plots
par(mfrow = c(2, 2)) 

#Plot for global active power
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#Plot for voltage
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

#Plot for submetering
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#Plot for  global reactive power
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()