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
plot(datetime, 
     Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
dev.copy(png, 
         file = "plot2.png",
         height = 480, 
         width = 480)
dev.off()

