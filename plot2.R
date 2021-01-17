library(dplyr)
setwd("C:/RstudioGithub/datasciencecoursera/ExploratoryDataAnalysis/Week 1")

elek <- tbl_df(read.csv(file = "household_power_consumption.txt", sep = ";"))
elek <- subset(elek, Date == c("1/2/2007", "2/2/2007"))
elek$Date <- strptime(elek$Date, format = "%d/%m/%Y")
elek$Time <- format(elek$Time, "%H:%M:%S")
elek$datetime <- as.POSIXct(paste(elek$Date, elek$Time, format="%Y-%m-%d %H:%M:%S"))
elek$Global_active_power <- as.numeric(elek$Global_active_power)

png(file = "plot2.png")
plot(elek$datetime, elek$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
axis(side=2, at = c(0, 2, 4, 6))
dev.off()