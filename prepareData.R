## Prepare Necessary Data
## @author Vincent Buzzano

## Simple function to download and extract zip file into the Data folder
## 1st: If the "Data" dir does not alerady exists, create it.
## 2nd: If the "Zip File" does not exists, download it
## 3rd: if the "Zip File" has not been extracted, extract it
prepareData <- function() {
    
    # 1. Create data directory if it does not already exists
    if (!file.exists(dataDir))
        dir.create(dataDir)
    
    # 2. Download data zip file if not exists in the data directory
    if (!file.exists(dataZipFile))
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                      destfile = dataZipFile, 
                      method   = "curl")
    
    # 3. extract dataset to data directory
    if (!file.exists(dataFile))
        unzip(zipfile = dataZipFile, exdir = dataDir)
}

dataDir     <- "data"
dataZipFile <- "household_power_consumption.zip"
dataFile    <- paste(dataDir, "household_power_consumption.txt", sep = "/")
colNames    <- c(
    'Date', 
    'Time', 
    'Global_active_power', 
    'Global_reactive_power', 
    'Voltage', 
    'Global_intensity', 
    'Sub_metering_1', 
    'Sub_metering_2', 
    'Sub_metering_3'
)
