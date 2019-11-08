install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)

ubi <- "C:/Users/HectorLP/Documents/ExploratoryDataAnalysis/exdata_data_NEI_data/"
dataPM25 <- readRDS(paste(ubi,"summarySCC_PM25.rds",sep=""))
dataSCC <- readRDS(paste(ubi,"Source_Classification_Code.rds",sep=""))

coal_idx <- grep("Coal",dataSCC$EI.Sector)
coal_match <- dataSCC[coal_idx,]
ECC <- dataPM25[(dataPM25$SCC %in% coal_match$SCC), ]

png(filename = paste(ubi,"plot4.pdf",sep=""), height = 419, width = 692)

x1 <- aggregate(Emissions ~ year, data = ECC, FUN=sum)
x2 <- barplot(x1$Emissions/100,names.arg=x1$year, ylim=c(0,max(x1$Emissions/100)+2000), col=heat.colors(4), main="Coal combustion-related emissions per year (x100)")
text(x = x2, y = round(x1$Emissions/100,2)+1000, label=round(x1$Emissions/100,2))

dev.off()