##Load table
hpc<-read.table("household_power_consumption.txt",header=FALSE,sep=";",skip=66637,nrows=2880, col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##Configure date & time as POSIXct
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")
hpc$DateTime<-as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")

##Cut Global_active_power into 
gap<-cut(hpc$Global_active_power,breaks=seq(0,6, by = 0.5))

##Create plot
plot(gap, col="red", xaxt='n')
title(main="Global Active Power",ylab="Frequency",xlab="Global Active Power (kilowatts)")
axis(labels=c("0","2","4","6"), side=1, at=c(0,4,8,12))

##Copy plot to png file
dev.copy(png,'plot1.png')
dev.off()