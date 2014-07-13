col.names<-t(read.table(file="\\household_power_consumption.txt",nrows=1,sep=";"))
df.power<-read.table(file="\\household_power_consumption.txt", skip=66637,nrows=2880,sep=";",col.names=col.names)

dateTime <- strptime(paste(df.power$Date,df.power$Time), format="%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")

#plot4
par(mfrow=c(2,2))
plot(dateTime,df.power$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
plot(dateTime,df.power$Voltage,type="l",lwd=0.3,ylab="Voltage",xlab="datetime")
plot(dateTime,df.power$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(dateTime,df.power$Sub_metering_2,col="red")
lines(dateTime,df.power$Sub_metering_3,col="blue")
legend("topright",cex=0.5,lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),text.font=1,bty="n")
plot(dateTime,df.power$Global_reactive_power,type="l",lwd=0.3,ylab="Global_reactive_power",xlab="datetime")
dev.copy(png,file="plot4.png", width=480,height=480)
dev.off()
