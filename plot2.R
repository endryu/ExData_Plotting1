plot2<-function(){
    ## read data from the file
    housholdpower<-read.csv("data/household_power_consumption.txt",sep=";",
                            na.strings="?",colClasses=c("character","character",
                                                        rep("numeric",7)))
    ourDates=housholdpower$Date=="1/2/2007"|housholdpower$Date=="2/2/2007"
    housholdpower<-housholdpower[ourDates, ]
    housholdpower[ ,2]<-as.POSIXct(paste(housholdpower[ ,1],housholdpower[ ,2]),
                                    format="%d/%m/%Y %H:%M:%S")
    ## open a graphic device
    png(file="data/plot2.png")
    ## create plot
    with(housholdpower,plot(Time,Global_active_power,type="l",xlab="",
                       ylab="Global Active Power (kilowatts)"))
    ## close the graphic device
    dev.off()
}