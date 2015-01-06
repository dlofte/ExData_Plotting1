#read in file

url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "power.zip")
unzip("power.zip" )
power <- read.table("household_power_consumption.txt", header = T, sep = ";", nrows=2075259, na.strings = "?")
str(power)

# Combine the Date and Time variables into a single Date variable that contains date and time information

dateTime <- paste(power$Date, power$Time)
str(dateTime)
power$Date <-strptime(dateTime, "%d/%m/%Y %H:%M:%S")

#subset Power to create data.frame newpower with the times we are interested in

newpower<-power[power$Date>"2007-02-01" & power$Date<"2007-02-03" &!is.na(power$Date) ,c(1,3,4,5,6,7,8,9)] 
str(newpower)

#Plot1
png(file = "plot1.png")
hist(newpower$Global_active_power, col ="red", main = "Global Active Power", xlab="Global Active Power(kilowatts)" )
dev.off()