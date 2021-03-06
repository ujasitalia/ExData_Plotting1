#reading full data
data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

#making a new column that has date and time combined
fullTimeDate <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data <- cbind(data, fullTimeDate)

#subsetting data based on the 2 dates given
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")

#creating a new .png file
png("plot4.png", width=480, height=480)

#plotting inside the .png file
par(mfrow=c(2,2))
with(data, plot(fullTimeDate, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(data, plot(fullTimeDate, Voltage, type = "l", xlab="datetime", ylab="Voltage"))
with(data, plot(fullTimeDate, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(data$fullTimeDate, data$Sub_metering_2,type="l", col= "red")
lines(data$fullTimeDate, data$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
with(data, plot(fullTimeDate, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()