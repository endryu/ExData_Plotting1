plot4<-function(){
    ## read data from the file
    housholdpower<-read.csv("data/household_power_consumption.txt",sep=";",
                            na.strings="?",colClasses=c("character","character",
                                                        rep("numeric",7)))
    ourDates=housholdpower$Date=="1/2/2007"|housholdpower$Date=="2/2/2007"
    housholdpower<-housholdpower[ourDates, ]
    housholdpower[ ,2]<-as.POSIXct(paste(housholdpower[ ,1],housholdpower[ ,2]),
                                   format="%d/%m/%Y %H:%M:%S")
    ## open a graphic device
    png(file="data/plot4.png")
    par(mfcol=c(2,2),mar=c(5,4,3,1))
    ## create plot
    with(housholdpower,plot(Time,Global_active_power,type="l",xlab="",
                            ylab="Global Active Power"))
    with(housholdpower,plot(Time,Sub_metering_1,type="l",xlab="",
                            ylab="Energy Sub Metering"))
    with(housholdpower,points(Time,Sub_metering_2,type="l",col="red"))
    with(housholdpower,points(Time,Sub_metering_3,type="l",col="blue"))
    legend("topright", lty = 1, col = c("black","red","blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
    with(housholdpower,plot(Time,Voltage,type="l",xlab="datetime"))
    with(housholdpower,plot(Time,Global_reactive_power,type="l",xlab="datetime"))
    ## close the graphic device
    dev.off()
    
}