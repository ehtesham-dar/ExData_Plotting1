house_pwr_cons<-read.csv("household_power_consumption.txt",sep=";")
house_pwr_cons$Date<-as.Date(house_pwr_cons$Date,format= "%d/%m/%Y")

sub_pwr_cons<-subset(house_pwr_cons,house_pwr_cons$Date>=as.Date("2007-02-01") & house_pwr_cons$Date<=as.Date("2007-02-02"))
sub_pwr_cons$Date<-paste(sub_pwr_cons$Date,sub_pwr_cons$Time,sep=" ")
sub_pwr_cons$Date<-strptime(sub_pwr_cons$Date,"%Y-%m-%d %H:%M:%S")


sub_pwr_cons$Global_active_power<-as.numeric(as.character(sub_pwr_cons$Global_active_power))
sub_pwr_cons$Voltage<-as.numeric(as.character(sub_pwr_cons$Voltage))
sub_pwr_cons$Sub_metering_1<-as.numeric(as.character(sub_pwr_cons$Sub_metering_1))
sub_pwr_cons$Sub_metering_2<-as.numeric(as.character(sub_pwr_cons$Sub_metering_2))
sub_pwr_cons$Sub_metering_3<-as.numeric(as.character(sub_pwr_cons$Sub_metering_3))
sub_pwr_cons$Global_reactive_power<-as.numeric(as.character(sub_pwr_cons$Global_reactive_power))


png(width=480,height=480,file="plot4.png",bg="transparent")
	par(mfrow=c(2,2))
	with(sub_pwr_cons,{
		
	plot(sub_pwr_cons$Date,sub_pwr_cons$Global_active_power,type="l",xlab="",ylab="Global Active Power",yaxt="n")
	axis(side=2,at=seq(0,3000,1000),labels=seq(0,6,2))

	plot(Date,Voltage,type="l",xlab="datetime",yaxt="n")
	axis(side=2,at=seq(from=800,to=2400,by=400),labels=seq(from=230,to=246,by=4))

	plot(Date,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
	points(Date,Sub_metering_2,type="l",col="red")
	points(Date,Sub_metering_3,type="l",col="blue")
	legend("topright",pch=151,col=c("grey1","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.9)


	plot(sub_pwr_cons$Date,sub_pwr_cons$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l",yaxt="n")
	axis(side=2,at=seq(from=0,to=250,by=50),labels=seq(from=0.0,to=0.5,by=0.1))
	})
dev.off()