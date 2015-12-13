getFilteredInputData <-
function(pathToFile, startDate = "01 Feb 2007 00:00:00", endDate = "03 Feb 2007 00:00:00", na = "?", sep = ";"
         , header = T, stringsAsFactors = F){
    
    
    if (!file.exists("data/household_power_consumption.txt")) {
      writeLines("data source missing, prepare for download")
      downloadZipFile()
    }
  
    writeLines("reading data..")
    inputDf <- read.csv(pathToFile, sep = sep, header = header, na.strings = na,stringsAsFactors=stringsAsFactors)
    inputDf$DateTime <-  strptime(paste(inputDf$Date, inputDf$Time), format="%d/%m/%Y %H:%M:%S")
    writeLines("filtering data..")
    filterDf <- subset(inputDf, DateTime >=  strptime(startDate, "%d %b %Y %H:%M:%S") & DateTime <  strptime(endDate, "%d %b %Y %H:%M:%S")) 
    filterDf <- filterDf[order(filterDf$DateTime),]
}

downloadZipFile <- function(downloadFolder = "./data", downloadUrl = "http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"){
  #create data folder path if it doesn't exist
  if (!file.exists("data")) {
    dir.create("data")
  }
  
  writeLines(paste("downloading to folder... ", downloadFolder))
  temp <- tempfile()
  download.file(downloadUrl,temp, mode="wb")
  unzip(temp, files = NULL, list = FALSE, overwrite = TRUE, junkpaths = FALSE, exdir = downloadFolder, unzip = "internal", setTimes = FALSE)
  unlink(temp)
}
