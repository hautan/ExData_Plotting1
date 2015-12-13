#TO DO add some global const enum strings for the below hardcoded values: folder, files
if (file.exists("Helper/fileReader.R")) {
  source("Helper/fileReader.R")     
} else {
  stop("helper function's missing")
}

inputDf <- getFilteredInputData("data/household_power_consumption.txt")
writeLines("ploting...")
png("plot2.png", width=480, height=480)
with(inputDf, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active power(kilowatts)"))
dev.off()