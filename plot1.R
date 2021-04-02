rep<-read.csv("household_power_consumption.txt",sep=";",header=TRUE,dec=".")

rep$Date<-as.Date(rep$Date,format="%d/%m/%Y")
rep$Time<-format(rep$Time, format="%H:%M:%S")

smol<-subset(rep,Date=="2007-02-01" | Date=="2007-02-02")
smol$Global_active_power <- as.numeric(smol$Global_active_power) 

png("plot1.png",height=480,width=480)
hist( smol$Global_active_power, main="Global Active Power",col="red", xlab="Global Active Power")
dev.off()