d = read.table("household_power_consumption.txt", sep=";",header = TRUE)
class(d$Date)
d$Date <- as.character(d$Date)
class(d$Date)
d$Date <- as.Date(d$Date, "%d/%m/%Y")
d$Time <- as.character(d$Time)

x <- paste(d$Date,d$Time)

d$Date_Time <- strptime(x,"%Y-%m-%d %H:%M:%S")
pqr<- d[d$Date == as.Date("2007-02-01") | d$Date == as.Date("2007-02-02"), ]

png('plot1.png',height=480,width =480)
hist(as.numeric(as.character(pqr$Global_active_power)),xlab="Global Active Power(kilowatts)",main="Global Active Power",col="red")
dev.off()
