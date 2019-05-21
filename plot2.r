# PLOT 2: LINE DRAWING OF GLOBAL ACTIVE POWER FOR A 2-DAY PERIOD.

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
png("plot2.png")
plot(x=data2$DateTime2, y=data2$Global_active_power, 
		xlab="", ylab="Global Active Power (kilowatts)", type="n")
lines(x=data2$DateTime2, y=data2$Global_active_power)		
dev.off()


