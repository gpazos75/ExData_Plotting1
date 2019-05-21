# PLOT 3: LINE DRAWINGS OF ENERGY SUB-METERING FOR A 2-DAY PERIOD.

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
png("plot3.png")
plot(x=data2$DateTime2, y=data2$Sub_metering_1, 
		xlab="", ylab="Energy sub metering", type="n")
lines(x=data2$DateTime2, y=data2$Sub_metering_1)	
lines(x=data2$DateTime2, y=data2$Sub_metering_2, col="red")
lines(x=data2$DateTime2, y=data2$Sub_metering_3, col="blue")	
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
		col=c("black","red","blue"), lty=1)	
dev.off()