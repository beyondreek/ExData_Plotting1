## Read the dataset "household_power_consumption" in ot hte variable "hpc" using "read_delim
hpc<-read_delim("household_power_consumption.txt",delim=";")

## Filter out data from February 1st and 2nd 2007 and store it in the variable "feb"
feb<-filter(hpc,Date=="1/2/2007"|Date=="2/2/2007")

## Convert column named "Date" in the filtered subset "feb" to object class "Date" using
## the function as.Date() 
feb$Date <- as.Date(ee$Date, format="%d/%m/%Y")

## Create a timestamp with Date and Time pasted together. Then convert it to POSIXct object class and create a column
## named "timestamp" in data.frame "feb" to store the POIXct timestamp.
dTime <- paste(as.Date(feb$Date), feb$Time)
feb$timestamp <- as.POSIXct(dTime)

## Set the graphical parameter "mfrow" to plot 4 plots in a 2x2 layout 
par(mfrow=c(2,2))

## Create 4 plots within the same graphic device. 
with(feb, {
        plot(Global_active_power~timestamp, type="l",ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~timestamp, type="l",ylab="Voltage", xlab="datetime")
        plot(Sub_metering_1~timestamp, type="l",ylab="Energy sub metering", xlab="")
            lines(Sub_metering_2~timestamp,col="red")
            lines(Sub_metering_3~timestamp,col="blue")
            legend("topright",col=c("black","red", "blue"),lty=1, lwd=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.85)
        plot(Global_reactive_power~timestamp, type="l",ylab="Global reactive power", xlab="datetime")
})

dev.copy(png,"plot4.png",height=480,width=600)
dev.off()
