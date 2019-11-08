install.packages("dplyr")
library(dplyr)

ubi <- "C:/Users/HectorLP/Documents/ExploratoryDataAnalysis/exdata_data_NEI_data/"
dataPM25 <- readRDS(paste(ubi,"summarySCC_PM25.rds",sep=""))
dataSCC <- readRDS(paste(ubi,"Source_Classification_Code.rds",sep=""))

x1 <- aggregate(Emissions ~ year, data = dataPM25,FUN=sum)

png(filename = paste(ubi,"plot1.pdf",sep=""), height = 419, width = 692)

x2 <- barplot(x1$Emissions/100,names.arg=x1$year, ylim=c(0,max(x1$Emissions/100)+6000), col=heat.colors(4), main="PM25 emissions per year (x100)")
text(x = x2, y = round(x1$Emissions/100,2)+3000, label=round(x1$Emissions/100,2))

dev.off()