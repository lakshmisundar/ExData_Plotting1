datasource_con <- file("household_power_consumption.txt")

filtered_data <- read.table(text = grep("^[1,2]/2/2007", readLines(datasource_con), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

#print(head(filtered_data))
close(datasource_con)

datetime <- strptime(paste(filtered_data$Date, filtered_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(datetime, filtered_data$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, filtered_data$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, filtered_data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, filtered_data$Sub_metering_2, type="l", col="red")
lines(datetime, filtered_data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, filtered_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()