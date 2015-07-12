
# The purpose here is to produce a plot as much as possible similar to the Plot 1. 
# Please notice that the code below requires the data to be extracted in the working directory. 


# 1/4 Get the data

data<-read.table("exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE, sep=";")

data_v2 <- data
data_v2$Date <- as.character(data$Date)
data_v2$Time <- as.character(data$Time)
data_v2$date_v2 <- strptime(paste(data_v2$Date,data_v2$Time), "%d/%m/%Y %H:%M:%S")

subData <- data_v2[data_v2$date_v2<"2007-02-03" & data_v2$date_v2>="2007-02-01" ,]


# 2/4 Initialize the plotting system

par(par())
par(mfrow=c(1,1))


# 3/4 Create the required plot

hist(as.numeric(as.character(subData$Global_active_power)), col=rgb(251,0,7,maxColorValue = 255),main="Global Active Power", xlab="Global Active Power (kilowatts)")


# 4/4 Copy it as a PNG file

dev.copy(png,"plot1.png")
dev.off()
