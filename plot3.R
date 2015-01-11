#### Plot 3 of Course Project 1 for the Coursera course "Exploratory Data Analysis"
#### Date: January 11, 2014
#### Author: fpromero (paskualf)

# setup messages
Sys.setlocale("LC_TIME", "English")


# Loading data
data <- read.csv("household_power_consumption.txt", sep=";", colClasses=c("character", "character", rep("numeric",7)),na="?")

# selection and transformation
data$Time <- with(data, strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
datads <- subset(data, Date %in% dates)

# Plotting
png("plot3.png", width=450, height=450)

with(datads, plot(Time, Sub_metering_1, xaxt=NULL, xlab = "", ylab = "Energy sub metering", type="n"))
with(datads, lines(Time, Sub_metering_1, col = "black", type = "S"))
with(datads, lines(Time, Sub_metering_2, col = "red", type = "S"))
with(datads, lines(Time, Sub_metering_3, col = "blue", type = "S"))
legend("topright", lty = c(1, 1), lwd = c(1, 1, 1), 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off()