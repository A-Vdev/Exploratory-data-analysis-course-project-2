library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset motor vehicle related NEI data
motor_vehicle<-SCC[grepl("vehicle", SCC$EI.Sector, ignore.case=TRUE),]
NEI_vehicle<-merge(NEI,motor_vehicle,by="SCC")

# Subset NEI data by Baltimore
Baltimore<-subset(NEI_vehicle,fips == "24510")

Total_emission<-tapply(Baltimore$Emissions,Baltimore$year,sum)

png("plot5.png")
ggplot(Baltimore,aes(factor(year),Emissions))+
  geom_bar(stat="identity", fill =rgb(0.8,0.1,0.1,0.6)) +
  labs(x="year", y=expression("Total PM2.5 Emission (tons)")) + 
  labs(title=expression("PM2.5 Motor Vehicle Emissions in Baltimore City from 1999-2008"))

dev.off()