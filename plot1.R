#Open file, selecting only the rows for 2/1/2007 and 2/2/2007
s_file <- "data/electric/household_power_consumption.txt"
d_file <- read.table(s_file,header=TRUE,sep=";")[66637:(66637+2879),]

#print histogram to screen and copy it to a png
hist(as.numeric(as.vector(d_file$Global_active_power)),xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",col="red")
dev.copy(png,file="PlotsAss1/ExData_Plotting1/plot1.png", height=480,width=480,units="px")
dev.off()
