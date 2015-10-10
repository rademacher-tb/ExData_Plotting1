## the following sources were used 
##
##  http://r.789695.n4.nabble.com/R-Subset-by-using-multiple-values-td815278.html
##  http://stackoverflow.com/questions/7535982/how-to-reset-parmfrow-in-r
##  http://www.statmethods.net/graphs/line.html
##


## load the source data

data_Electric <- read.csv("household_power_consumption.txt",
                          sep=";",
                          na.strings = "?")

## subset the data for just the two dates listed in the project

data_Electric2 <- subset.data.frame(data_Electric, data_Electric$Date %in% list("1/2/2007","2/2/2007"))

## add a datetime column
data_Electric2 <- cbind(data_Electric2[,1:9],strptime(paste(data_Electric2$Date,data_Electric2$Time), "%d/%m/%Y %H:%M:%S"))

## change the name of the datetime column
tCols <- colnames(data_Electric2)
tCols[length(tCols)] <- "electricity_time"
colnames(data_Electric2) <- tCols


## Plot the 4 charts in one
png(filename = "C:/Users/Tom/Documents/Tom_Learning/Coursera_JH_GettingCleaningData/Project 1/plot4.png")

par(mfrow=c(2,2))

plot(data_Electric2$electricity_time,data_Electric2$Global_active_power, 
     type="l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
lines(data_Electric2$electricity_time,data_Electric2$Global_active_power)

plot(data_Electric2$electricity_time,data_Electric2$Voltage, 
     type="l",
     ylab = "Voltage",
     xlab = "datetime")
lines(data_Electric2$electricity_time,data_Electric2$Voltage)

plot(data_Electric2$electricity_time,data_Electric2$Sub_metering_1, 
     type="l",
     ylab = "Energy sub metering",
     xlab = "")
lines(data_Electric2$electricity_time,data_Electric2$Sub_metering_1)
lines(data_Electric2$electricity_time,data_Electric2$Sub_metering_2, col = 2)
lines(data_Electric2$electricity_time,data_Electric2$Sub_metering_3, col = 3)
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c(1,2,3), lty=c(1,1,1), title = NULL)

plot(data_Electric2$electricity_time,data_Electric2$Global_reactive_power, 
     type="l",
     ylab = "Global_reactive_power",
     xlab = "datetime")
lines(data_Electric2$electricity_time,data_Electric2$Global_reactive_power)

dev.off()

