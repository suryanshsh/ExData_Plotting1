addrs <- "household_power_consumption.txt"
hcp <- read.table(addrs, sep=";", stringsAsFactors=FALSE, dec=".", header=T)
hcp <- hcp[hcp$Date %in% c("1/2/2007","2/2/2007") ,]
hcp$Date <- as.Date(hcp$Date,format="%d/%m/%Y")
png("plot1.png",width =500 ,height = 500)
hist(as.numeric(hcp$Global_active_power) , col='red',xlab="Global Active Power (killowatts)",main="Global Active Power")
dev.off()
