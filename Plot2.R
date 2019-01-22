setwd ("C:/Users/gerson/Desktop/DOST/exdata_data_household_power_consumption")

#Load dataset
data <- read.table("C:/Users/tydani/Desktop/DOST/exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Convert the date variable in date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Use only the data between '2007-01-01' and '2007-02-02'
data_in_use <- subset(data, Date <= "2007-02-02" & Date >= "2007-02-01")

#Convert dates and times
datetime <- strptime(paste(data_in_use$Date, data_in_use$Time), "%Y-%m-%d %H:%M:%S")

#Create plot
globalActivePower <- as.numeric(data_in_use$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()