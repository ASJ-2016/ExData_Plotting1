
# Data
setwd("C:/SPTLS_2016/Cursos/Coursera/01 -  Data Science/04 - Exploratory Data Analysis/Quizes and Assigments/Assig1")

data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", 
                   stringsAsFactors=FALSE, dec=".")

# We will only be using data from the dates 2007-02-01 and 2007-02-02.
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# convert the Date and Time variables to Date/Time classes 
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


# Plot 4
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, 
     as.numeric(subSetData$Global_active_power), 
     type="l", 
     xlab="", 
     ylab="Global Active Power", cex=0.2)
plot(datetime, 
     as.numeric(subSetData$Voltage), 
     type="l", 
     xlab="datetime", 
     ylab="Voltage")
plot(datetime, 
     as.numeric(subSetData$Sub_metering_1), 
     type="l", 
     ylab="Energy Submetering", 
     xlab="")

lines(datetime, 
      as.numeric(subSetData$Sub_metering_2), 
      type="l", 
      col="red")
lines(datetime, 
      as.numeric(subSetData$Sub_metering_3), 
      type="l", 
      col="blue")

legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, 
       lwd=2.5, 
       col=c("black", "red", "blue"), 
       bty="o")

plot(datetime, 
     as.numeric(subSetData$Global_reactive_power), 
     type="l", 
     xlab="datetime", 
     ylab="Global_reactive_power")

dev.off()
