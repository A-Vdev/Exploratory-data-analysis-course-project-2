
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data by Baltimore
Baltimore<-subset(NEI,fips == "24510")

Total_emission<-tapply(Baltimore$Emissions,Baltimore$year,sum)

png("plot2.png")
barplot(Total_emission, xlab="Year", 
        ylab="PM2.5 Emissions (tons)", 
        main="Total PM2.5 Emissions in Baltimore City", ylim=c(0,3500),
        col=rgb(0.8,0.1,0.1,0.6))

dev.off()