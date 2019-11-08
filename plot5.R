install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)

ubi <- "C:/Users/HectorLP/Documents/ExploratoryDataAnalysis/exdata_data_NEI_data/"
dataPM25 <- readRDS(paste(ubi,"summarySCC_PM25.rds",sep=""))
dataSCC <- readRDS(paste(ubi,"Source_Classification_Code.rds",sep=""))

png(filename = paste(ubi,"plot5.pdf",sep=""), height = 419, width = 692)

x1 <- aggregate(Emissions ~ year+type, data = filter(dataPM25,fips=="24510",type=="ON-ROAD"), FUN=sum)
x2 <- barplot(x1$Emissions,names.arg=x1$year, ylim=c(0,max(x1$Emissions)+50), col=heat.colors(4), main="Motor Vehicle emissions per year in Baltimore")
text(x = x2, y = round(x1$Emissions,2)+20, label=round(x1$Emissions,2))

dev.off()