
##readdata
setwd("~/R/R Projects/Exploratory Data Analysis/Electric power consumption")
filename <- "household_power_consumption.txt"
alldata <- read.table(filename,sep = ";",header = T,stringsAsFactors=FALSE)
mydata <- alldata[ which(alldata$Date=="1/2/2007" | alldata$Date=="2/2/2007"),]

#plot

globalActivePower <- as.numeric(mydata$Global_active_power)
png("plot1.png",width = 480, height = 480)
hist(globalActivePower,col = "red",xlab = "Global Active Power (kilowatts)",main="Global Active Power")
dev.off()