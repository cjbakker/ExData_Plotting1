file.URL <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file.URL, destfile="exdata-data-household_power_consumption.zip")
unzip("exdata-data-household_power_consumption.zip")
power <- read.csv("household_power_consumption.txt", sep=";", header=TRUE)
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power <- power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02",]
hist(as.numeric(as.character(power$Global_active_power)),
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red",
     xlim=c(0,6), ylim=c(0,1200))
dev.copy(png, "plot1.png")
dev.off()