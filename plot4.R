#Set parameter to plot in a 2x2 grid
par(mfrow=c(2,2))

#Open file, selecting only the rows for 2/1/2007 and 2/2/2007
s_file <- "data/electric/household_power_consumption.txt"
d_file <- read.table(s_file,header=TRUE,sep=";")[66637:(66637+2879),]

#Print plot 1 -  line graph to screen
plot((strptime(paste(d_file$Date,d_file$Time,sep=";"),format="%d/%m/%Y;%H:%M:%S")),
     d_file$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#Print plot 2 - line graph to screen
plot((strptime(paste(d_file$Date,d_file$Time,sep=";"),format="%d/%m/%Y;%H:%M:%S")),
     d_file$Voltage,type="l", xlab="datetime",ylab="Voltage")

#Print plot 3 - line graph with additional lines and legend
plot((strptime(paste(d_file$Date,d_file$Time,sep=";"),format="%d/%m/%Y;%H:%M:%S")),
     as.numeric(as.vector(d_file$Sub_metering_1)),type="l",xlab="",ylab="Energy sub metering")
lines((strptime(paste(d_file$Date,d_file$Time,sep=";"),format="%d/%m/%Y;%H:%M:%S")),
     as.numeric(as.vector(d_file$Sub_metering_2)),col="red")
lines((strptime(paste(d_file$Date,d_file$Time,sep=";"),format="%d/%m/%Y;%H:%M:%S")),
      as.numeric(as.vector(d_file$Sub_metering_3)),col="blue")

legend("topright",lty=c(1,1,1), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch=c(NA,NA,NA),col=c("black","red","blue"),cex=.5,text.width = 60000,bty="n")

#Print plot 4 -  line graph to screen
plot((strptime(paste(d_file$Date,d_file$Time,sep=";"),format="%d/%m/%Y;%H:%M:%S")),
     d_file$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

#Copy to png file
dev.copy(png,file="PlotsAss1/ExData_Plotting1/plot4.png", height=480,width=480,units="px")
dev.off()
