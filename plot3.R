install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)

ubi <- "C:/Users/HectorLP/Documents/ExploratoryDataAnalysis/exdata_data_NEI_data/"
dataPM25 <- readRDS(paste(ubi,"summarySCC_PM25.rds",sep=""))
dataSCC <- readRDS(paste(ubi,"Source_Classification_Code.rds",sep=""))

x1 <- aggregate(Emissions ~ year+type, data = filter(dataPM25,fips=="24510"), FUN=sum)

png(filename = paste(ubi,"plot3.pdf",sep=""), height = 419, width = 692)

ggplot(x1, aes(x=factor(year), y=Emissions, fill=type,label = round(Emissions,2))) +
  geom_bar(stat="identity") +
  facet_grid(. ~ type) +
  xlab("year") +
  ylab(expression("Total PM25 emissions")) +
  ggtitle("Type of Emissions in Baltimore")+
  geom_label(aes(fill = type), colour = "white", fontface = "bold")

dev.off()