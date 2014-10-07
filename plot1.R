## Plot 1
## @author Vincent buzzano

# prepare data
source('prepareData.R')
prepareData()

# Read Data 
data <- read.table(
    file = dataFile, 
    header = T, 
    sep = ";", 
    dec = ".", 
    colClasses = c(rep('character', 2), rep('numeric',6)), 
    col.names = colNames,
    na.strings = '?'
)

# Update Date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Filters data on Date
data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"), ]

# Open PNG Graphic Device
png(filename = 'plot1.png', width = 480, height = 480, units = 'px', bg = 'white')

# Draw Histogram
hist(data$Global_active_power, 
     col = 'red', 
     main = 'Global Active Power', 
     xlab = 'Global Active Power (Kilowatts)'
)

# Close Device Graphic (save file)
dev.off()
