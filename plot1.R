### read the file from txt file
t1<- read.delim("household_power_consumption.txt",header = T,sep = ";",na.strings = "?")


### remove ?? from the file
t2<- na.omit(t1)
#####Read 1st and 2nd feb 2007

t3<- filter(t2,strptime(t2$Date,format = "%d/%m/%Y") %in% c('2007-02-01','2007-02-02'))


###plot global active power
hist(as.numeric(t3$Global_active_power),ylim=c(0,1200),main = "Global Active Power",xlab = "Global Active Power (Kilowatts)",col=2)

######
library(datasets)
######## png file printing

dev.copy(png,file="plot1.png",height= 480, width=480)

dev.off