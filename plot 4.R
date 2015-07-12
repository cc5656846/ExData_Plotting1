library(data.table)

# Loading data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, "consumption.zip")
unzip("consumption.zip")

DT <- fread("household_power_consumption.txt")
DT$Date.new = as.Date(DT$Date, format = "%d/%m/%Y")
DTS = DT[((DT$Date.new >= "2007-02-01") & (DT$Date.new <= "2007-02-02")),]
DTS$datetime = as.POSIXct(paste(Date.new, Time))
DTS$Global_active_power <- as.numeric(DTS$Global_active_power)

attach(DTS)

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(datetime, 
     Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

plot(datetime, 
     as.numeric(Voltage),
     type = "l",
     ylab = "Voltage",
     xlab = "datetime")

plot(datetime, 
     as.numeric(Sub_metering_1),
     type = "l",
     ylab = "Energy sub metering",
     xlab = "")
lines(datetime, as.numeric(Sub_metering_2), col = 'red')
lines(datetime, as.numeric(Sub_metering_3), col = 'blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1, lwd=1)

plot(datetime, 
     as.numeric(Global_reactive_power),
     type = "l",
     ylab = "Global_reactive_power",
     xlab = "datetime")
dev.off()