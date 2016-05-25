rm(list=ls())

con<-file("household_power_consumption.txt",open = "r")
dat_df<-read.table(con,TRUE,sep = ";",nrows = 150000)
close(con)

dates<-as.Date(dat_df$Date,"%d/%m/%Y")
#dates2<-strptime(dat_tim, "%d/%m/%Y %H:%M:%S")


dat1<-dates=="2007-02-01"
dat2<-dates=="2007-02-02"
data<-rbind(dat_df[dat1,],dat_df[dat2,])

t<-paste(data$Date,data$Time,sep = " ")
x<-as.numeric(as.character(data$Global_active_power))

hist(x,col = "red",xlab = "Global Active Power",main="Global Active Power")

dev.copy(png,file="plot1.png")
dev.off()