## Read the dataset "household_power_consumption" in ot hte variable "hpc" using "read_delim
hpc<-read_delim("household_power_consumption.txt",delim=";")

## Filter out data from February 1st and 2nd 2007 and store it in the variable "feb"
feb<-filter(hpc,Date=="1/2/2007"|Date=="2/2/2007")

## Plot a historgram of the "Global Active Power" in the filtered dataset "feb"; x-axis label is Global Active Power
hist(feb$Global_active_power,xlab = "Global Active Power (kilowatts) ", ylab="Frequency",col="red", main=" Global Active Power")

## Store the histogram as a png using the function "dev.copy()" and then close the graphics device using "dev.off() 
dev.copy(png,"plot1.png")
dev.off()