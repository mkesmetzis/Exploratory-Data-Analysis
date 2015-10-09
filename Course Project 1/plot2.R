##readdata
setwd("~/R/R Projects/Exploratory Data Analysis/Electric power consumption")
filename <- "household_power_consumption.txt"
alldata <- read.table(filename,sep = ";",header = T,stringsAsFactors=FALSE)
mydata <- alldata[ which(alldata$Date=="1/2/2007" | alldata$Date=="2/2/2007"),]

#plot

Sys.setlocale("LC_TIME", "English")
datetime <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(mydata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()