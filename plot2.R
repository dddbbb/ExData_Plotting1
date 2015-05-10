library(data.table)
Sys.setlocale("LC_TIME", "English")

data<-read.table(file = "./household_power_consumption.txt",
                 header = TRUE,
                 sep = ";",
                 colClasses = c("character", "character", rep("numeric",7)),
                 na = "?")

data<-data[(data$Date == "1/2/2007"|data$Date=="2/2/2007"),]
data$Time <- paste(data$Date, data$Time)
data$Time <- strptime(data$Time, "%d/%m/%Y %H:%M:%S")
png("plot2.png", width = 480, height = 480)

plot(data$Time, data$Global_active_power, type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()