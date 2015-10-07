col.names<-t(read.table(file="household_power_consumption.txt",nrows=1,sep=";"))
df.power<-read.table(file="household_power_consumption.txt", skip=66637,nrows=2880,sep=";",col.names=col.names)

dateTime <- strptime(paste(df.power$Date,df.power$Time), format="%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")

#plot3
plot(dateTime,df.power$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(dateTime,df.power$Sub_metering_2,col="red")
lines(dateTime,df.power$Sub_metering_3,col="blue")
legend("topright",cex=0.75,lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="plot3.png", width=480,height=480)
dev.off()
