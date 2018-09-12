#Coursera Course 4 - Exploratory Data Analysis 
#Week 1 Course Project 
#Plot 3

#read and prepare the data 
dat <- read.csv("household_power_consumption.txt", sep=";", na.string="?") 
#reformat Date column 
dat$Date <- as.Date(dat$Date, "%d/%m/%Y") 
#subset for dates 2007-02-01 and 2007-02-02
dat2 <- subset(dat, dat$Date=="2007-02-01")
dat3 <- subset(dat, dat$Date=="2007-02-02") 
dat <- rbind(dat2, dat3) 

#reformat Time 
newtime <- paste(dat$Date, dat$Time) 
newtime <- strptime(newtime, "%Y-%m-%d %H:%M:%S") 
dat <- cbind(newtime, dat)

#plot 
plot(dat$newtime, dat$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="") 
lines(dat$newtime, dat$Sub_metering_2, col="red") 
lines(dat$newtime, dat$Sub_metering_3, col="blue") 
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
par(bg="white") 

#copy plot to a file 
dev.copy(png, file="plot3.png") 
dev.off()