#TO DO add some global const enum strings for the below hardcoded values: folder, files
if (file.exists("Helper/fileReader.R")) {
  source("Helper/fileReader.R")     
} else {
  stop("helper function's missing")
}

inputDf <- getFilteredInputData("data/household_power_consumption.txt")
writeLines("ploting...")
png("plot3.png", width=480, height=480)
with(inputDf, {
  #plot Sub_metering_1
  plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")   
  #plot Sub_metering_2
  lines(DateTime, Sub_metering_2, col="red")
  #plot Sub_metering_3
  lines(DateTime, Sub_metering_3, col="blue")
  
  
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, col=c("black", "red", "blue"))
}
)
dev.off()