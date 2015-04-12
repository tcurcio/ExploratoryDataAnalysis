## Read the entire file

##Do this in a function instead
ReadFile <- function(){
        fileContents <- read.csv("./Data/household_power_consumption.txt", 
                                 header=T, 
                                 sep=';', 
                                 na.strings="?", 
                                 nrows=2075259, 
                                 check.names=F, 
                                 stringsAsFactors=F, 
                                 comment.char="", 
                                 quote='\"')
        
        fileContents
}

fileContents <- ReadFile()

##Format the date
fileContents$Date <- as.Date(fileContents$Date, format="%d/%m/%Y")

## Get only the two days we are looking for by replacing data frame with subsetted version of itself
fileContents <- subset(fileContents, subset=(Date >= "2007-02-01" & Date < "2007-02-03"))

## Converting dates
datetime <- paste(as.Date(fileContents$Date), fileContents$Time)
fileContents$Datetime <- as.POSIXct(datetime)


## Plot 2
plot(fileContents$Global_active_power~fileContents$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()