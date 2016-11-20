library(sqldf)
library(lubridate)

hhpc = read.csv.sql('household_power_consumption.txt', 
                    "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                    sep=';')

day_time = dmy_hms(paste(hhpc$Date, hhpc$Time))

png('plot3.png')

plot(day_time, hhpc$Sub_metering_1, type='n',
     xlab='', ylab='Energy sub metering')
lines(day_time, hhpc$Sub_metering_1,col='black')
lines(day_time, hhpc$Sub_metering_2,col='red')
lines(day_time, hhpc$Sub_metering_3,col='blue')
legend('topright', col=c('black','red','blue'), lty='solid', lwd=1,
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       xjust=1)
dev.off()

