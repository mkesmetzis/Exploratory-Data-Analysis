##readdata
setwd("~/R/R Projects/Exploratory Data Analysis/Electric power consumption")
filename <- "household_power_consumption.txt"
alldata <- read.table(filename,sep = ";",header = T,stringsAsFactors=FALSE)
mydata <- alldata[ which(alldata$Date=="1/2/2007" | alldata$Date=="2/2/2007"),]

#plot

Sys.setlocale("LC_TIME", "English")
Sub_metering_1 <- as.numeric(mydata$Sub_metering_1)
Sub_metering_2 <- as.numeric(mydata$Sub_metering_2)
Sub_metering_3 <- as.numeric(mydata$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datetime,Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(datetime,Sub_metering_2,col = "red")
lines(datetime,Sub_metering_3,col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()