

# Loading data
data <- read.csv("household_power_consumption.txt", sep=";", colClasses=c("character", "character", rep("numeric",7)),na="?")

# selection and transformation
data$Time <- with(data, strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
datads <- subset(data, Date %in% dates)

#Plotting
#setup
png("plot4.png", width=600, height=600)
par(mfrow=c(2,2))

# Plot 1 (0,0)
with(datads, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
# Plot 2 (0, 1)
with(datads, plot(Time, Voltage, type="l", xlab="datetime", ylab="Voltage"))
# Plot 3 (1, 0)
with(datads, plot(Time, Sub_metering_1, xaxt=NULL, xlab = "", ylab = "Energy sub metering", type="n"))
with(datads, lines(Time, Sub_metering_1, col = "black", type = "S"))
with(datads, lines(Time, Sub_metering_2, col = "red", type = "S"))
with(datads, lines(Time, Sub_metering_3, col = "blue", type = "S"))
legend("topright", lty = c(1, 1), lwd = c(1, 1, 1), 
       col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

# Plot 4 (1, 1)
with(datads, plot(Time, Global_reactive_power, type="n",xlab="datetime", ylab="Global_reactive_power"))
with(datads, lines(Time, Global_reactive_power))

dev.off()