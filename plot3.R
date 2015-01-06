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

#plot3
png(file="plot3.png")
with(newpower, plot(Date,Sub_metering_1, type = "l",  ylab="Energy sub Metering", xlab=""))
with(newpower, points(Date, Sub_metering_2, col = "red", type = "l",   xlab=""))
with(newpower, points(Date, Sub_metering_3, col = "blue", type = "l",   xlab=""))
legend("topright", lty=1, col =c("black", "red", "blue"),  legend = names(newpower[6:8]))
dev.off()