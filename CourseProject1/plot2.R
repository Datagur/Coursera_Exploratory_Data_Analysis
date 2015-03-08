## For the whole dataset
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
## date format
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")
## Subsert data only for the interested dates
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
##remove the bigger data set to clear space
rm(data_full)
## Converting date formats
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
## coninuous line Plot 2
plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
## Final file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()