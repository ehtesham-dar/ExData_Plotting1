house_pwr_cons<-read.csv("household_power_consumption.txt",sep=";")
house_pwr_cons$Date<-as.Date(house_pwr_cons$Date,format= "%d/%m/%Y")

sub_pwr_cons<-subset(house_pwr_cons,house_pwr_cons$Date>=as.Date("2007-02-01") & house_pwr_cons$Date<=as.Date("2007-02-02"))
sub_pwr_cons$Date<-paste(sub_pwr_cons$Date,sub_pwr_cons$Time,sep=" ")
sub_pwr_cons$Date<-strptime(sub_pwr_cons$Date,"%Y-%m-%d %H:%M:%S")

sub_pwr_cons$Sub_metering_1<-as.numeric(as.character(sub_pwr_cons$Sub_metering_1))
sub_pwr_cons$Sub_metering_2<-as.numeric(as.character(sub_pwr_cons$Sub_metering_2))
sub_pwr_cons$Sub_metering_3<-as.numeric(as.character(sub_pwr_cons$Sub_metering_3))

png(width=480,height=480,file="plot3.png",bg="transparent")
	par(mfrow=c(1,1),mar=c(4,4,2,1),oma=c(1,1,2,0))
	with(sub_pwr_cons,plot(Date,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
	with(sub_pwr_cons,points(Date,Sub_metering_2,type="l",col="red"))
	with(sub_pwr_cons,points(Date,Sub_metering_3,type="l",col="blue"))
	legend("topright",pch=151,col=c("grey1","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()