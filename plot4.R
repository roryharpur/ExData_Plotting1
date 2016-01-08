data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors = FALSE)
data <- subset(data, data$Date %in% c("2/2/2007", "1/2/2007"))
data <- mutate(data, datetime = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))
png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
## graph 1
plot(data$datetime, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", main = "", type="n")
lines(data$datetime, data$Global_active_power, type="l")
## graph 2
plot(data$datetime, data$Voltage, xlab = "datetime", ylab = "Global Active Power (kilowatts)", main = "", type="n")
lines(data$datetime, data$Voltage, type="l")
## graph 3
plot(data$datetime, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", main = "", type="n")
lines(data$datetime, data$Sub_metering_1, type="l", col="black")
lines(data$datetime, data$Sub_metering_2, type="l", col="red")
lines(data$datetime, data$Sub_metering_3, type="l", col="blue")
par(legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1)))
## graph 4
plot(data$datetime, data$Global_reactive_power, xlab = "datetime", ylab = "Global Reactive Power (kilowatts)", main = "", type="n")
lines(data$datetime, data$Global_reactive_power, type="l")
dev.off()