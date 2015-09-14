### read the file from txt file. This is text file
t1<- read.delim("household_power_consumption.txt",header = T,sep = ";",na.strings = "?")


### remove ?? from the file
t2<- na.omit(t1)
#####Read 1st and 2nd feb 2007

library(dplyr)

t3<- filter(t2,strptime(t2$Date,format = "%d/%m/%Y") %in% c('2007-02-01','2007-02-02'))


###### create date time column in t3
t3<-within(t3,date_time<- paste(as.Date(t3$Date,format = "%d/%m/%Y"),t3$Time))

### converting date_time from char to POXIT and POXICT format
t3$date_time<- strptime(t3$date_time, format = "%Y-%m-%d %H:%M:%S")

##### 4 by 4
par(mfrow=c(1,4))

###First plot

plot(t3$date_time,t3$Global_active_power,type="l",ylab = "Global Active Power (Kilowatts)",xlab = "")

####second plot


plot(t3$date_time,t3$Voltage,type ="l",ylab = "Voltage",xlab = "")


###plot 3

plot(t3$date_time,t3$Sub_metering_1,type="l",ylab = "Sub_metering_1",xlab = "")
points(t3$date_time,t3$Sub_metering_2,type="l",ylab = "Sub_metering_2",xlab = "",col=2)
points(t3$date_time,t3$Sub_metering_3,type="l",ylab = "Sub_metering_3",xlab = "",col=4)
legend(x=40,y=30,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c(1,2,4))
##Plot 4

plot(t3$date_time,t3$Global_reactive_power,type="l",ylab = "Global reactive Power",xlab = "")

library(datasets)
######## png file printing

dev.copy(png,file="plot4.png",height= 480, width=480)

dev.off()
