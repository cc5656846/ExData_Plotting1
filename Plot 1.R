# Loading data

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, "consumption.zip")
unzip("consumption.zip")
DT <- fread("household_power_consumption.txt")
DT$Date.new = as.Date(DT$Date, format = "%d/%m/%Y")
DTS = DT[((DT$Date.new >= "2007-02-01") & (DT$Date.new <= "2007-02-02")),]

attach(DTS)

# Plot 1: histogram of global active power

Global_active_power = as.numeric(Global_active_power)

hist(Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.copy(png, 
         file = "plot1.png", 
         height = 480, 
         width = 480)
dev.off()