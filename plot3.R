file.URL <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file.URL, destfile="exdata-data-household_power_consumption.zip")
unzip("exdata-data-household_power_consumption.zip")
power <- read.csv("household_power_consumption.txt", sep=";", header=TRUE)
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power <- power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02",]
plot(as.numeric(as.character(power$Sub_metering_1)), type="l", 
     xlab="", ylab="Energy sub metering", xaxt="n")
axis(1, c(0,1440,2880), c("Thu", "Fri", "Sat"))
lines(as.numeric(as.character(power$Sub_metering_2)), type="l", col="red")
lines(as.numeric(as.character(power$Sub_metering_3)), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1),
       col=c("black", "red", "blue"))
dev.copy(png, "plot3.png")
dev.off()