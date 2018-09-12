#Coursera Course 4 - Exploratory Data Analysis 
#Week 1 Course Project 
#Plot 2

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
plot(dat$newtime, dat$Global_active_power, type="l", ylab="Global active power (kilowatts)", xlab="")
par(bg="white") 

#copy plot to a file 
dev.copy(png, file="plot2.png") 
dev.off()