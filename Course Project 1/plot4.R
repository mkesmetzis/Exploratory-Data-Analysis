##readdata
setwd("~/R/R Projects/Exploratory Data Analysis/Electric power consumption")
filename <- "household_power_consumption.txt"
alldata <- read.table(filename,sep = ";",header = T,stringsAsFactors=FALSE)
mydata <- alldata[ which(alldata$Date=="1/2/2007" | alldata$Date=="2/2/2007"),]

#plot

Sys.setlocale("LC_TIME", "English")
datetime <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(mydata$Global_active_power)
Sub_metering_1 <- as.numeric(mydata$Sub_metering_1)
Sub_metering_2 <- as.numeric(mydata$Sub_metering_2)
Sub_metering_3 <- as.numeric(mydata$Sub_metering_3)
Voltage <- as.numeric(mydata$Voltage)
GlobalReactivePower <- as.numeric(mydata$Global_reactive_power)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

#1.1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#1.2
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
#2.1
plot(datetime,Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(datetime,Sub_metering_2,col = "red")
lines(datetime,Sub_metering_3,col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=2.5, col=c("black", "red", "blue"),bty = "n")
#2.2
plot(datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()