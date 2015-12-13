#TO DO add some global const enum strings for the below hardcoded values: folder, files
if (file.exists("Helper/fileReader.R")) {
  source("Helper/fileReader.R")     
} else {
  stop("helper function's missing")
}

inputDf <- getFilteredInputData("data/household_power_consumption.txt")
writeLines("ploting...")
png("plot1.png", width=480, height=480)
hist(inputDf$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()