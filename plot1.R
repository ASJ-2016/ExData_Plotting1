
# Data
setwd("C:/SPTLS_2016/Cursos/Coursera/01 -  Data Science/04 - Exploratory Data Analysis/Quizes and Assigments/Assig1")

data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", 
                   stringsAsFactors=FALSE, dec=".")

# We will only be using data from the dates 2007-02-01 and 2007-02-02.
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# convert the Date and Time variables to Date/Time classes 
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


# Plot 1
png("plot1.png", width=480, height=480)

hist(as.numeric(subSetData$Global_active_power), 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off()