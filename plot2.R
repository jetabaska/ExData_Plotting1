library(sqldf)
library(lubridate)

hhpc = read.csv.sql('household_power_consumption.txt', 
                    "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                    sep=';')

day_time = dmy_hms(paste(hhpc$Date, hhpc$Time))

png('plot2.png')
plot(day_time, hhpc$Global_active_power, type='l',
     xlab='',
     ylab='Global Active Power (kilowatts)')
dev.off()
