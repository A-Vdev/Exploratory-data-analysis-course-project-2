NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Total_emission<-tapply(NEI$Emissions,NEI$year,sum)

png("plot1.png")
barplot(Total_emission/1000, xlab="Year", 
        ylab="PM2.5 Emissions (Kilotons)", 
        main="Total PM2.5 Emissions", ylim=c(0,8000))

dev.off()