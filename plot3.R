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

## Create 3 plots withi the same graphic device. The three plots are "Sub metering 1" , "Sub metering 2" and
## "Sub metering 3" in colors black, red and blue respectively. The function lines() can plot over an open plot 
## created by the graphic device.

with(feb, {
        plot(Sub_metering_1~timestamp, type="l",ylab="Energy sub metering", xlab="")
                lines(Sub_metering_2~timestamp,col="red")
                lines(Sub_metering_3~timestamp,col="blue")
                legend("topright",col=c("black","red", "blue"),lty=1, lwd=1,
                       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.85)
})

##Save the plot above to a png file and then close the graphics device
dev.copy(png,"plot3.png")
dev.off()
