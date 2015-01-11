#### Plot 1 of Course Project 1 for the Coursera course "Exploratory Data Analysis"
#### Date: January 11, 2014
#### Author: fpromero (paskualf)

# Loading data
data <- read.csv("household_power_consumption.txt", sep=";", 
                 colClasses=c("character", "character", rep("numeric",7)),na="?")

# selection and transformation
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
datads <- subset(data, Date %in% dates)

# Plotting
png("plot1.png", width=450, height=450)
with(datads, hist(Global_active_power, main="Global Active Power", 
                  xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red"))
dev.off()