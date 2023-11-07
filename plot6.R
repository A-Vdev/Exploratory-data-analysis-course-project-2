library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset motor vehicle related NEI data
motor_vehicle<-SCC[grepl("vehicle", SCC$EI.Sector, ignore.case=TRUE),]
NEI_vehicle<-merge(NEI,motor_vehicle,by="SCC")

# Subset NEI data by Baltimore and LA
Baltimore_LA<-subset(NEI_vehicle,fips == "24510"| fips == "06037")
Baltimore_LA$city<-ifelse(Baltimore_LA$fips==24510,"Baltimore City","Los Angeles County")

ggplot(Baltimore_LA,aes(factor(year),Emissions,fill=city))+geom_bar(stat ="identity")+
  facet_wrap(. ~ city,nrow=1)+ggtitle("Total Motor Vehicle Emissions in Baltimore & LA")+
  xlab("Year")+ ylab("PM2.5 Emissions in Tons")



  



