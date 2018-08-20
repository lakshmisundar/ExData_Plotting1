datasource_con <- file("household_power_consumption.txt")

filtered_data <- read.table(text = grep("^[1,2]/2/2007", readLines(datasource_con), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

#print(head(filtered_data))
close(datasource_con)

GlobalActivePower <- as.numeric(filtered_data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()