library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data by Baltimore
Baltimore<-subset(NEI,fips == "24510")

png("plot3.png")
ggplot(Baltimore,aes(factor(year),Emissions,fill=factor(year)))+geom_bar(stat ="identity")+
  facet_wrap(.~type,nrow=1)+ggtitle("Total PM2.5 Emissions in Baltimore City, Maryland")+
  xlab("Year")+ ylab("PM2.5 Emissions in Tons") +
  theme_gray() + theme(plot.title = element_text(hjust = 0.5))

dev.off()