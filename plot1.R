data <- read.table("./household_power_consumption.txt", sep= ";", header = TRUE, stringsAsFactors = FALSE, na.string = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
dfplot <- data[(data$Date == "2007-02-01") | (data$Date == "2007-02-02"),]
png(filename = "plot1.png")
hist(dfplot$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

