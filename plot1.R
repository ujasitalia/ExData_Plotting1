#reading full data
data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

#converting character to date class
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subsetting data based on the 2 dates given
data <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")

#creating a new .png file
png("plot1.png", width=480, height=480)

#plotting histogram in the .png file
hist(data$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

dev.off()
