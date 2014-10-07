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

# create Datatime
data$Datetime <- strptime(paste(data$Date, data$Time), '%Y-%m-%d %H:%M:%S')

# Open PNG Graphic Device
png(filename = 'plot3.png', width = 480, height = 480, units = 'px', bg = 'white')

# Draw graph
with(data, { 
    plot(Datetime, Sub_metering_1, type = 'l', col = 'black', ylab = 'Energy sub metering', xlab = '')
    points(Datetime, Sub_metering_2, type = 'l', col = 'red')
    points(Datetime, Sub_metering_3, type = 'l', col = 'blue')
    legend("topright", c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lty = 1)
})

# Close Device Graphic (save file)
dev.off()
