# get full data set
fulldataset <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
# get only the days required
febdata <- subset(fulldataset, Date %in% c("1/2/2007","2/2/2007"))
# format date
febdata$Date <- as.Date(febdata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(febdata$Date), febdata$Time)
febdata$Datetime <- as.POSIXct(datetime)

# create plot
with(febdata, {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
})


library(datasets)
#copy from device to a png file.
dev.copy(png, file = "plot2.png", width=480, height=480) 
#close png file
dev.off()