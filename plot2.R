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
daterange<-c(as.POSIXlt(min(t)),as.POSIXlt(max(t)))

x<-as.numeric(as.character(data$Global_active_power))

plot(t,x,type="l",xlab="",ylab = "Global Active Power (kilowatts)")

dev.copy(png,file="plot2.png")
dev.off()
