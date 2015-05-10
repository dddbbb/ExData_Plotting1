library(data.table)
Sys.setlocale("LC_TIME", "English")

data<-read.table(file = "./household_power_consumption.txt",
                 header = TRUE,
                 sep = ";",
                 colClasses = c("character", "character", rep("numeric",7)),
                 na.strings = "?")

data<-data[(data$Date == "1/2/2007"|data$Date=="2/2/2007"),]
data$Time <- paste(data$Date, data$Time)
data$Time <- strptime(data$Time, "%d/%m/%Y %H:%M:%S")
png("plot3.png", width = 480, height = 480)
plot(data$Time, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
dev.off()