#Coursera Course 4 - Exploratory Data Analysis 
#Week 1 Course Project 
#Plot 1 

#read and prepare the data 
dat <- read.csv("household_power_consumption.txt", sep=";", na.string="?") 
#reformat Date column 
dat$Date <- as.Date(dat$Date, "%d/%m/%Y") 
#subset for dates 2007-02-01 and 2007-02-02
dat2 <- subset(dat, dat$Date=="2007-02-01")
dat3 <- subset(dat, dat$Date=="2007-02-02") 
dat <- rbind(dat2, dat3) 

#make the historgram plot 
hist(as.numeric(dat$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")  
par(bg="white") 

#copy plot to a file 
dev.copy(png, file="plot1.png") 
dev.off()
