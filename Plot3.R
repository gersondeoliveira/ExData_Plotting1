setwd ("C:/Users/gerson/Desktop/DOST/exdata_data_household_power_consumption")

#Load dataset
data <- read.table("C:/Users/gerson/Desktop/DOST/exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Convert the date variable in date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Use only the data between '2007-01-01' and '2007-02-02'
data_in_use <- subset(data, Date <= "2007-02-02" & Date >= "2007-02-01")

#Convert date and time
datetime <- strptime(paste(data_in_use$Date, data_in_use$Time), "%Y-%m-%d %H:%M:%S")

#Creating the submeters
subMetering1 <- as.numeric(data_in_use$Sub_metering_1)
subMetering2 <- as.numeric(data_in_use$Sub_metering_2)
subMetering3 <- as.numeric(data_in_use$Sub_metering_3)

#Creating plot
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()