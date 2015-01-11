#### Plot 2 of Course Project 1 for the Coursera course "Exploratory Data Analysis"
#### Date: January 11, 2014
#### Author: fpromero (paskualf)


# setup messages
Sys.setlocale("LC_TIME", "English")

#loading data
data <- read.csv("household_power_consumption.txt", sep=";", 
                 colClasses=c("character", "character", rep("numeric",7)),na="?")


# selection and transformation
data$Time <- with(data, strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
datads <- subset(data, Date %in% dates)


# Plotting
png("plot2.png", width=450, height=450)
with(datads, plot(Time, Global_active_power, type="l", 
                  xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()