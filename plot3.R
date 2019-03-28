addrs <- "household_power_consumption.txt"
hcp <- read.table(addrs, sep=";", stringsAsFactors=FALSE, dec=".", header=T)
hcp <- hcp[hcp$Date %in% c("1/2/2007","2/2/2007") ,]
hcp$Date <- as.Date(hcp$Date,format="%d/%m/%Y")
#hcp$Date <- weekdays(hcp$Date)
x_axis <- strptime(paste(hcp$Date,hcp$Time,sep=" "),"%Y-%m-%d %H:%M:%S")
png("plot3.png",width =480 ,height = 480)
plot(x_axis,hcp$Sub_metering_1,type="l",ylab="Energy submetering",xlab = "")
lines(x_axis,hcp$Sub_metering_2,col="red",type = "l")
lines(x_axis,hcp$Sub_metering_3,col="blue",type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
