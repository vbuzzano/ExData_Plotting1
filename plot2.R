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
png(filename = 'plot2.png', width = 480, height = 480, units = 'px', bg = 'white')

# Draw plot 2
with(data, 
     plot(
         Datetime, Global_active_power, 
         type = 'l', 
         xlab = '', 
         ylab = 'Global Active Power (kilowatts)'
    )
)

# Close Device Graphic (save file)
dev.off()
