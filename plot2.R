rep<-read.csv("household_power_consumption.txt",sep=";",header=TRUE,dec=".")

rep$Date<-as.Date(rep$Date,format="%d/%m/%Y")
rep$Time<-format(rep$Time, format="%H:%M:%S")

#rep$Global_active_power <- as.numeric(rep$Global_active_power)


smol<-subset(rep,Date=="2007-02-01" | Date=="2007-02-02")

smol$Global_active_power <- as.numeric(smol$Global_active_power) 

tmestm<-strptime(paste(smol$Date, smol$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
smol <- cbind(smol, tmestm)

png("plot2.png",height=480,width=480)
with(smol,plot( tmestm,smol$Global_active_power, type="l",xlab=" ",ylab="Global Active Power(kilowatt)"))
dev.off()