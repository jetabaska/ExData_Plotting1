library(sqldf)

hhpc = read.csv.sql('household_power_consumption.txt', 
                    "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                    sep=';')

png('plot1.png')
with(hhpc, hist(Global_active_power, col='red',
                main='Global Active Power',
                xlab='Global Active Power (kilowatts)'))
dev.off()
