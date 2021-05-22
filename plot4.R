# get full data set
fulldataset <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
# get only the days required
febdata <- subset(fulldataset, Date %in% c("1/2/2007","2/2/2007"))
# format date
febdata$Date <- as.Date(febdata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(febdata$Date), febdata$Time)
febdata$Datetime <- as.POSIXct(datetime)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
with(febdata, {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="")
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub Metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, bty="n", cex=0.5,
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l",lty=1, lwd=1, ylab="Global ReActive Power", xlab="")
    
})

#close png file
dev.off()
