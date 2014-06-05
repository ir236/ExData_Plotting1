data <- read.table("./household_power_consumption.txt", sep= ";", header = TRUE, stringsAsFactors = FALSE, na.string = "?")
data$DateTime <- strptime(paste(data$Date, data$Time),format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
dfplot <- data[(data$Date == "2007-02-01") | (data$Date == "2007-02-02"),]
Sys.setlocale(category = "LC_TIME", locale = "C")

png(filename = "plot4.png")
par(mfrow = c(2, 2))
##1
plot(dfplot$DateTime,dfplot$Global_active_power, type="n", ylab = "Global Active Power", xlab = "")
lines(dfplot$DateTime,dfplot$Global_active_power, type = "l")

##2
plot(dfplot$DateTime,dfplot$Voltage, type="n", ylab = "Voltage", xlab = "datetime")
lines(dfplot$DateTime,dfplot$Voltage, type = "l")
##3
plot(dfplot$DateTime,dfplot$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab = "")
lines(dfplot$DateTime,dfplot$Sub_metering_1, type = "l", col = "black")
lines(dfplot$DateTime,dfplot$Sub_metering_2, type = "l", col = "red")
lines(dfplot$DateTime,dfplot$Sub_metering_3, type = "l", col = "blue")
legend("topright", lwd = 1, bty = "n", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","blue","red"))
##4
plot(dfplot$DateTime,dfplot$Global_reactive_power, ylab = "Global_reactive_power",type="n", xlab = "datetime")
lines(dfplot$DateTime,dfplot$Global_reactive_power, type = "l")
dev.off()

