#Open file, selecting only the rows for 2/1/2007 and 2/2/2007
s_file <- "data/electric/household_power_consumption.txt"
d_file <- read.table(s_file,header=TRUE,sep=";")[66637:(66637+2879),]

#print line graph to screen and copy it to a png
plot((strptime(paste(d_file$Date,d_file$Time,sep=";"),format="%d/%m/%Y;%H:%M:%S")),
     d_file$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,file="PlotsAss1/ExData_Plotting1/plot2.png", height=480,width=480,units="px")
dev.off()
