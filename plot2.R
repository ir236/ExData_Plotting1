data <- read.table("./household_power_consumption.txt", sep= ";", header = TRUE, stringsAsFactors = FALSE, na.string = "?")
data$DateTime <- strptime(paste(data$Date, data$Time),format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
dfplot <- data[(data$Date == "2007-02-01") | (data$Date == "2007-02-02"),]
Sys.setlocale(category = "LC_TIME", locale = "C")
png(filename = "plot2.png")
plot(dfplot$DateTime,dfplot$Global_active_power, type="n", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(dfplot$DateTime,dfplot$Global_active_power, type = "l")
dev.off()

