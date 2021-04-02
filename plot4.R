rep<-read.csv("household_power_consumption.txt",sep=";",header=TRUE,dec=".")

rep$Date<-as.Date(rep$Date,format="%d/%m/%Y")
rep$Time<-format(rep$Time, format="%H:%M:%S")

smol<-subset(rep,Date=="2007-02-01" | Date=="2007-02-02")

smol$Global_active_power <- as.numeric(smol$Global_active_power)
smol$Sub_metering_1 <- as.numeric(smol$Sub_metering_1)
smol$Sub_metering_2 <- as.numeric(smol$Sub_metering_2)
smol$Sub_metering_3 <- as.numeric(smol$Sub_metering_3)
smol$Global_reactive_power <- as.numeric(smol$Global_reactive_power)
smol$Voltage <- as.numeric(smol$Voltage)


tmestm<-strptime(paste(smol$Date, smol$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
smol <- cbind(smol, tmestm)

png("plot4.png",height=480,width=480)
par(mfrow =c(2,2))
plot(tmestm,smol$Global_active_power, type="l",xlab="Days",ylab="Global Active Power(kilowatt)")

plot(tmestm,smol$Voltage,type="l",ylab="Volatge",xlab="datetime")

plot(tmestm,smol$Sub_metering_1, type="l",xlab="Days",ylab="Energy sub metering")
lines(tmestm,smol$Sub_metering_2, type="l",col="red")
lines(tmestm,smol$Sub_metering_3,type="l",col="blue")
legend("topright",inset=0.02,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,box.lty=0)

plot(tmestm,smol$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()