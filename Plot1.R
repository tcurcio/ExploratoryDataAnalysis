## Read the entire file
fileContents <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

##Format the date
fileContents$Date <- as.Date(fileContents$Date, format="%d/%m/%Y")

## Get only the two days we are looking for by replacing data frame with subsetted version of itself
fileContents <- subset(fileContents, subset=(Date >= "2007-02-01" & Date < "2007-02-03"))

## Converting dates
datetime <- paste(as.Date(fileContents$Date), fileContents$Time)
fileContents$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(fileContents$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## save to folder
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()