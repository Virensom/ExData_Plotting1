# get full data set
fulldataset <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
# get only the days required
febdata <- subset(fulldataset, Date %in% c("1/2/2007","2/2/2007"))
# format date
febdata$Date <- as.Date(febdata$Date, format="%d/%m/%Y")
# create histogram
hist(febdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

library(datasets)
#copy from device to a png file.
dev.copy(png, file = "plot1.png", width=480, height=480)
#close png file
dev.off()