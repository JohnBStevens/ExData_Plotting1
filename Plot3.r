##Load table
hpc<-read.table("household_power_consumption.txt",header=FALSE,sep=";",skip=66637,nrows=2880, col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##Configure date & time as POSIXct
#hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")
hpc$DateTime<-as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")

##Create plot
plot(hpc$Sub_metering_1~hpc$DateTime, col="black", type="l", ylab="Energy Sub Metering", xlab="")
points(hpc$Sub_metering_2~hpc$DateTime, col="red", type="l")
points(hpc$Sub_metering_3~hpc$DateTime, col="blue", type="l")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=c(2,2))

##Copy plot to png file
dev.copy(png,'plot3.png')
dev.off()