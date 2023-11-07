library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset coal combustion related NEI data
Coal<-SCC[grepl("Coal",SCC$EI.Sector,ignore.case = TRUE),]
NEI_Coal<-merge(NEI,Coal,by='SCC')

coal_Total<-tapply(NEI_Coal$Emissions, NEI_Coal$year, sum)

png("plot4.png")
ggplot(NEI_Coal,aes(factor(year),Emissions/1000))+
  geom_bar(stat="identity", fill =rgb(0.8,0.1,0.1,0.6)) +
  labs(x="year", y=expression("Total PM2.5 Emission (kilotons)")) + 
  labs(title=expression("PM2.5 Coal Combustion Source Emissions Across US from 1999-2008"))

dev.off()