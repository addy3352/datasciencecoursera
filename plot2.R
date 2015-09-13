### read the file from txt file
t1<- read.delim("household_power_consumption.txt",header = T,sep = ";",na.strings = "?")


### remove ?? from the file
t2<- na.omit(t1)
#####Read 1st and 2nd feb 2007

t3<- filter(t2,strptime(t2$Date,format = "%d/%m/%Y") %in% c('2007-02-01','2007-02-02'))


###### create date time column in t3
t3<-within(t3,date_time<- paste(as.Date(t3$Date,format = "%d/%m/%Y"),t3$Time))

### converting date_time from char to POXIT and POXICT format
t3$date_time<- strptime(t3$date_time, format = "%Y-%m-%d %H:%M:%S")


###plot global active power
plot(t3$date_time,t3$Global_active_power,type="l",ylab = "Global Active Power (Kilowatts)",xlab = "")
######

library(datasets)
######## png file printing

dev.copy(png,file="plot1.png",height= 480, width=480)

dev.off