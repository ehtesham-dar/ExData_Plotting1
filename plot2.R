house_pwr_cons<-read.csv("household_power_consumption.txt",sep=";")
house_pwr_cons$Date<-as.Date(house_pwr_cons$Date,format= "%d/%m/%Y")

sub_pwr_cons<-subset(house_pwr_cons,house_pwr_cons$Date>=as.Date("2007-02-01") & house_pwr_cons$Date<=as.Date("2007-02-02"))
sub_pwr_cons$Date<-paste(sub_pwr_cons$Date,sub_pwr_cons$Time,sep=" ")
sub_pwr_cons$Date<-strptime(sub_pwr_cons$Date,"%Y-%m-%d %H:%M:%S")
sub_pwr_cons$Global_active_power<-as.numeric(as.character(sub_pwr_cons$Global_active_power))

png(width=480,height=480,file="plot2.png",bg="transparent")
	par(mfrow=c(1,1),mar=c(4,4,2,1),oma=c(1,1,2,0))
	plot(sub_pwr_cons$Date,sub_pwr_cons$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()