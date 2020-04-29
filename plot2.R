#reading full data
data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

#making a new column that has date and time combined
fullTimeDate <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data <- cbind(data, fullTimeDate)

#subsetting data based on the 2 dates given
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")

#creating a new .png file
png("plot2.png", width=480, height=480)

#plotting inside the .png file
with(data, plot(fullTimeDate, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))

dev.off()