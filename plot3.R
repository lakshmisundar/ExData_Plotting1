datasource_con <- file("household_power_consumption.txt")

filtered_data <- read.table(text = grep("^[1,2]/2/2007", readLines(datasource_con), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

#print(head(filtered_data))
close(datasource_con)

datetime <- strptime(paste(filtered_data$Date, filtered_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(filtered_data$Global_active_power)

png("plot3.png", width=480, height=480)
plot(datetime, filtered_data$Sub_metering_1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, filtered_data$Sub_metering_2, type="l", col="red")
lines(datetime, filtered_data$Sub_metering_3, type="l", col="blue")

legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()