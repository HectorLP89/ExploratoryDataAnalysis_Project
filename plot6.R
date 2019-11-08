install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)

ubi <- "C:/Users/HectorLP/Documents/ExploratoryDataAnalysis/exdata_data_NEI_data/"
dataPM25 <- readRDS(paste(ubi,"summarySCC_PM25.rds",sep=""))
dataSCC <- readRDS(paste(ubi,"Source_Classification_Code.rds",sep=""))

png(filename = paste(ubi,"plot6.pdf",sep=""), height = 419, width = 692)

x1 <- aggregate(Emissions ~ year+type+fips, data = filter(dataPM25,fips=="24510"|fips=="06037",type=="ON-ROAD"), FUN=sum)
x1$city <- ifelse(x1$fips=="06037","LA","Baltimore")

ggplot(x1, aes(x=factor(year), y=Emissions, fill=city,label = round(Emissions,2))) +
  geom_bar(stat="identity") +
  facet_grid(city~.,scales="free") +
  xlab("Year") +
  ylab(expression("Total PM25 emission")) +
  ggtitle(expression("Emissions in Baltimore and Los Angeles")) +
  geom_label(aes(fill = city), colour = "white", fontface = "bold")

dev.off()