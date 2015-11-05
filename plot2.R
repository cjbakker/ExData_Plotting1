file.URL <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file.URL, destfile="exdata-data-household_power_consumption.zip")
unzip("exdata-data-household_power_consumption.zip")
power <- read.csv("household_power_consumption.txt", sep=";", header=TRUE)
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power <- power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02",]
plot(as.numeric(as.character(power$Global_active_power)),
     type="l", xaxt="n", xlab="", ylab="Global Active Power (kilowatts)")
axis(1, c(0,1440,2880), c("Thu", "Fri", "Sat"))
dev.copy(png, "plot2.png")
dev.off()