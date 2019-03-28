addrs <- "household_power_consumption.txt"
hcp <- read.table(addrs, sep=";", stringsAsFactors=FALSE, dec=".", header=T)
hcp <- hcp[hcp$Date %in% c("1/2/2007","2/2/2007") ,]
hcp$Date <- as.Date(hcp$Date,format="%d/%m/%Y")
#hcp$Date <- weekdays(hcp$Date)
x_axis <- strptime(paste(hcp$Date,hcp$Time,sep=" "),"%Y-%m-%d %H:%M:%S")
png("plot2.png",width =500 ,height = 500)
plot(x_axis,hcp$Global_active_power,type="l",xlab = "",ylab ="Global Active Power (killowatts)" )
dev.off()
