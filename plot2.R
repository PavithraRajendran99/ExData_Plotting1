d = read.table("household_power_consumption.txt", sep=";",header = TRUE)
class(d$Date)
d$Date <- as.character(d$Date)
class(d$Date)
d$Date <- as.Date(d$Date, "%d/%m/%Y")
d$Time <- as.character(d$Time)
x <- paste(d$Date,d$Time)
d$Date_Time <- strptime(x,"%Y-%m-%d %H:%M:%S")
pqr<- d[d$Date == as.Date("2007-02-01") | d$Date == as.Date("2007-02-02"), ]

png('plot2.png',height=480,width =480)
class(pqr$Date)
plot(pqr$Date_Time,as.numeric(pqr$Global_active_power)/500,type="l",xlab="",ylab="Global Active Power(kilowatts)")
pqr$Sub_metering_2 <- factor(pqr$Sub_metering_2)
plot(pqr$Date_Time,as.numeric(pqr$Sub_metering_1),type="l",xlab="",ylab="Energy sub metering",col="black",ylim=c(0,35), yaxt="n")
par(new=TRUE)
plot(pqr$Date_Time,as.numeric(pqr$Sub_metering_2),type="l",xlab="",ylab="Energy sub metering",col="red",ylim=c(0,35), yaxt="n")
par(new=TRUE)
plot(pqr$Date_Time,as.numeric(pqr$Sub_metering_3),type="l",xlab="",ylab="Energy sub metering",col="blue",ylim=c(0,35), yaxt="n")
ticks = c(0, 10, 20,30)
axis(side = 2, at = ticks)
dev.off()
