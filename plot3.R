
# The purpose here is to produce a plot as much as possible similar to the Plot 3. 
# Please notice that the code below requires the data to be extracted in the working directory. 


# 1/5 Get the data

data<-read.table("exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE, sep=";")

data_v2 <- data
data_v2$Date <- as.character(data$Date)
data_v2$Time <- as.character(data$Time)
data_v2$date_v2 <- strptime(paste(data_v2$Date,data_v2$Time), "%d/%m/%Y %H:%M:%S")

subData <- data_v2[data_v2$date_v2<"2007-02-03" & data_v2$date_v2>="2007-02-01" ,]


# 2/5 Open the PNG device

png("plot3.png")


# 3/5 Initialize the plotting system

par(par())
par(mfrow=c(1,1))


# 4/5 Create the required plot

Sys.setlocale(category = "LC_TIME", locale = "usa")
plot(subData$date_v2,as.numeric(as.character(subData$Sub_metering_1)),type="l",xlab="",ylab="Energy sub metering")
lines(subData$date_v2,as.numeric(as.character(subData$Sub_metering_2)),col="red")
lines(subData$date_v2,as.numeric(as.character(subData$Sub_metering_3)),col="blue")
legend(
  "topright",
  lty="solid",
  col = c("black","blue","red"),
  legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
  inset = c(0,0),
  cex=1
  )


# 5/5 Close the PNG device

dev.off()
