#TO DO add some global const enum strings for the below hardcoded values: folder, files
if (file.exists("Helper/fileReader.R")) {
  source("Helper/fileReader.R")     
} else {
  stop("helper function's missing")
}


inputDf <- getFilteredInputData("data/household_power_consumption.txt")
writeLines("ploting...")
png("plot4.png", width=480, height=480)
#panel with 4 plots
par(mfcol=c(2,2))

# plot2.R
with(inputDf, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active power(kilowatts)"))

# plot3.R
with(inputDf, {
  #plot Sub_metering_1
  plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")   
  #adding Sub_metering_2
  lines(DateTime, Sub_metering_2, col="red")
  #adding Sub_metering_3
  lines(DateTime, Sub_metering_3, col="blue")
  
  
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, col=c("black", "red", "blue"))
}
)

# Voltage 
with(inputDf, plot(DateTime, Voltage, type="l", xlab="datetime"))

# Global_reactive_power
with(inputDf, plot(DateTime, Global_reactive_power, type="l", xlab="datetime"))
dev.off()