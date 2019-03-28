addrs <- "household_power_consumption.txt"
hcp <- read.table(addrs, sep=";", stringsAsFactors=FALSE, dec=".", header=T)
hcp <- hcp[hcp$Date %in% c("1/2/2007","2/2/2007") ,]
hcp$Date <- as.Date(hcp$Date,format="%d/%m/%Y")
#hcp$Date <- weekdays(hcp$Date)
x_axis <- strptime(paste(hcp$Date,hcp$Time,sep=" "),"%Y-%m-%d %H:%M:%S")

png("plot4.png",width=500,height = 500)
par(mfrow=c(2,2))
plot(x_axis,hcp$Global_active_power,type="l",xlab = "",ylab ="Global Active Power (killowatts)" )
plot(x_axis,hcp$Voltage,type="l",xlab = "",ylab ="Voltage" )
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
hist(as.numeric(hcp$Global_active_power) , col='red',xlab="Global Active Power (killowatts)")
plot(x_axis,hcp$Global_reactive_power,type="l",xlab = "datetime",ylab ="Global_reactive_power" )
par(mar=c(4,4,2,2))

dev.off()

