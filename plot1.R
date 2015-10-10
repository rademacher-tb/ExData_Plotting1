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


## Plot the histogram

png(filename = "plot1.png")

    hist(data_Electric2$Global_active_power, 
         main = "Global Active Power", 
         xlab = "Global Active Power (kilowatts)", 
         col = "red")

dev.off()
