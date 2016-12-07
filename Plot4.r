##Load table
hpc<-read.table("household_power_consumption.txt",header=FALSE,sep=";",skip=66637,nrows=2880, col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##Configure date & time as POSIXct
#hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")
hpc$DateTime<-as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")

#Create 2x2 grid for plots
par(mfcol=c(2,2))
par(mar=c(4,4,4,4))

##Create plot 2
plot(hpc$Global_active_power~hpc$DateTime, col="black", type="l", ylab="Global Active Power", xlab="")

##Create plot 3
plot(hpc$Sub_metering_1~hpc$DateTime, col="black", type="l", ylab="Energy Sub Metering", xlab="")
points(hpc$Sub_metering_2~hpc$DateTime, col="red", type="l")
points(hpc$Sub_metering_3~hpc$DateTime, col="blue", type="l")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=c(2,2))

##Create Voltage plot 
plot(hpc$Voltage~hpc$DateTime, col="black", type="l", ylab="Voltage", xlab="datetime")

##Create Reactive plot 
plot(hpc$Global_reactive_power~hpc$DateTime, col="black", type="l", ylab="Voltage", xlab="datetime")

##Copy plot to png file
dev.copy(png,'plot4.png')
dev.off()