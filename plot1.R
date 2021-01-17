library(dplyr)
setwd("C:/RstudioGithub/datasciencecoursera/ExploratoryDataAnalysis/Week 1")

elek <- tbl_df(read.csv(file = "household_power_consumption.txt", sep = ";"))
elek <- subset(elek, Date == c("1/2/2007", "2/2/2007"))
elek$Date <- strptime(elek$Date, format = "%d/%m/%Y")
elek$Global_active_power <- as.numeric(elek$Global_active_power)

png(file = "plot1.png")
hist(elek$Global_active_power, breaks = seq(0, 6, 0.5), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts", xaxt="n", yaxt="n")
axis(side=1, at=c(0, 2, 4, 6))
axis(side=2, at = seq(0, 600, 100))
dev.off()
