library(data.table)
data<-read.table(file = "./household_power_consumption.txt",
                 header = TRUE,
                 sep = ";",
                 colClasses = c("character", "character", rep("numeric",7)),
                 na.strings = "?")
data<-data[(data$Date == "1/2/2007"|data$Date=="2/2/2007"),]
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()