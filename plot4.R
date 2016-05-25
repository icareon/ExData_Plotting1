rm(list=ls())

con<-file("household_power_consumption.txt",open = "r")
dat_df<-read.table(con,TRUE,sep = ";",nrows = 150000)
close(con)

dates<-as.Date(dat_df$Date,"%d/%m/%Y")

dat1<-dates=="2007-02-01"
dat2<-dates=="2007-02-02"
data<-rbind(dat_df[dat1,],dat_df[dat2,])

date_time<-paste(data$Date,data$Time,sep = " ")
t<-strptime(date_time, "%d/%m/%Y %H:%M:%S")

gap<-as.numeric(as.character(data$Global_active_power))
v<-as.numeric(as.character(data$Voltage))
grp<-as.numeric(as.character(data$Global_reactive_power))

x1<-as.numeric(as.character(data$Sub_metering_1))
x2<-as.numeric(as.character(data$Sub_metering_2))
x3<-as.numeric(as.character(data$Sub_metering_3))

par(mfrow=c(2,2))
plot(t,gap,type = "l",xlab="",ylab="Global Active Power")
plot(t,v,type="l",xlab = "datetime",ylab="Voltage")

plot(t,x1,type="l",xlab="",ylab = "Energy Sub metering")
lines(t,x2,col="red")
lines(t,x3,col="blue")
legend("topright",pch="-",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(t,grp,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.copy(png,file="plot4.png")
dev.off()