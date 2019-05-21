# PLOT 4: GRIDED GRAPH OF LINE DRAWINGS FOR 4 VARIABLES FOR A 2-DAY PERIOD.

# Required packages
library(data.table)

# Reading and exploring data (the data file must be in the working directory)
data1 <- fread("household_power_consumption.txt", sep=";", 
					header=TRUE, na.string="?")
data1

summary(data1)
str(data1)
names(data1)

# Subsetting rows for February 1st and 2nd, 2007
data2 <- data1[data1$Date=="1/2/2007" | data1$Date=="2/2/2007",]

# Adding a new column with Date and time as a vector of class "Date"
data2[, DateTime:=paste(Date,Time)]
data2[, DateTime2:=strptime(DateTime, format="%d/%m/%Y %H:%M:%S")]
data2

# Plotting and sending to png file device
png("plot4.png")
par(mfcol=c(2,2))
	# First plot (Global active power)
	plot(x=data2$DateTime2, y=data2$Global_active_power, 
			xlab="", ylab="Global Active Power", type="n")
	lines(x=data2$DateTime2, y=data2$Global_active_power)

	# Second plot (Energy sub-metering)
	plot(x=data2$DateTime2, y=data2$Sub_metering_1, 
			xlab="", ylab="Energy sub metering", type="n")
	lines(x=data2$DateTime2, y=data2$Sub_metering_1)	
	lines(x=data2$DateTime2, y=data2$Sub_metering_2, col="red")
	lines(x=data2$DateTime2, y=data2$Sub_metering_3, col="blue")	
	legend("topright", legend=c("Sub_metering_1","Sub_metering_2",
			"Sub_metering_3"), col=c("black","red","blue"), lty=1)	

	# Third plot (Voltage)		
	plot(x=data2$DateTime2, y=data2$Voltage, 
			xlab="datetime", ylab="Voltage", type="n")
	lines(x=data2$DateTime2, y=data2$Voltage)	

	# Fourth plot (Global reactive power)
	plot(x=data2$DateTime2, y=data2$Global_reactive_power, 
			xlab="", ylab="Global_reactive_power", type="n")
	lines(x=data2$DateTime2, y=data2$Global_reactive_power)	
dev.off()