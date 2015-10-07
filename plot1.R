col.names<-t(read.table(file="household_power_consumption.txt",nrows=1,sep=";"))
df.power<-read.table(file="household_power_consumption.txt", skip=66637,nrows=2880,sep=";",col.names=col.names)

dateTime <- strptime(paste(df.power$Date,df.power$Time), format="%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")

#plot1
hist(df.power$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png", width=480,height=480)
dev.off()
