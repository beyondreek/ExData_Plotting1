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

## Plot "Global active power" as it varies accross the timestamp ( R created x-axis ticks as days 
## corresponding to the data in tiemstamp). Y-axis label is " Global Active Power (kilowatts)"
with(feb, plot(Global_active_power~timestamp, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

##Save the plot above to a png file and then close the graphics device
dev.copy(png,"plot2.png")
dev.off()