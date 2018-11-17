#R Homework
#--------------
# #1
#read data
WHO = read.csv("WHO.csv")
View(WHO)	

#Country with Lowest Literacy
WHO$Country[which.min(WHO$LiteracyRate)]

#Richest Country in Europe based on GNI
#create subset for Countries with Region == Europe
WHO.Europe = subset(WHO, Region == "Europe")
View(WHO.Europe)
WHO.Europe$Country[which.max(WHO.Europe$GNI)]

#Mean Life Expectancy of countries in Africa 
#create subset for Countries with Region == Africa
WHO.Africa = subset(WHO, Region == "Africa")
View(WHO.Africa)
mean(WHO.Africa$LifeExpectancy)

#Number of countries with population greater than 10000
#create subset for Countries with Population > 10000
WHO.10k<-subset(WHO,WHO$Population>10000)
nrow(WHO.10k)

#Top 5 countries in Americas with highest child mortality
#create subset for Countries with Region == Americas
WHO.Americas = subset(WHO, Region == "Americas",select=c(Country,ChildMortality))
View(WHO.Americas)
#List down 5 countries with the highest Child Mortality rates in descending order  
CM<-head(WHO.Americas[order(WHO.Americas$ChildMortality, decreasing=TRUE),], n=5)
View(CM)

# #2. I first converted the xlsx file into a proper csv file
#read data 
NBA = read.csv("Historical NBA Performance.csv")
View(NBA)

#The year Bulls has the highest winning average
NBA$Year[which.max(NBA$Winning.Percentage[NBA$Team=="Bulls"])]

#Teams with an even win-loss record in a year 
Year<-NBA$Year[NBA$Winning.Percentage==0.500]
Team<-NBA$Team[NBA$Winning.Percentage==0.500]
data.frame(Year,Team)  

# #3
#read data
STAT = read.csv("Seasons_Stats.csv")
View(STAT)


#Player with highest 3pt attempt rate in a season
x = aggregate(STAT$X3PAr~STAT$Player+STAT$Year, FUN=sum, na.rm=TRUE) 
x$`STAT$Player`[max(x$`STAT$X3PAr`)]

#Player with highest free throw rate in a season
y = aggregate(STAT$FTr~STAT$Player+STAT$Year, FUN=sum, na.rm=TRUE) 
y$`STAT$Player`[max(y$`STAT$FTr`)]

#Year LeBron James scored the highest
#create subset for Lebron's stats
LeBron <- subset(STAT,Player=="LeBron James",select=c(Year,Player,FG))
LeBron
LeBron$Year[which.max(LeBron$FG)]

#Year Michael Jordan scored the highest
#create subset for Jordan's stats
MJ <- subset(STAT,Player=="Michael Jordan*",select=c(Year,Player,FG))
MJ
MJ$Year[which.max(MJ$FG)]

#4
#read data
NU <- read.csv("National Universities Rankings.csv")
View(NU)

#University with most number of undergrads
NU$UE = as.numeric(gsub(",", "", NU$Undergrad.Enrollment))
NU$Name[which.max(NU$UE)]

#Average Tuition for Top10
#List down top 10 universities by rank
Top10<-head(NU,10)
View(Top10)

#Convert Tuition.and.fees column into computable data by removing dollar sign and comma, and turning it to numeric data
Top10$tuition = as.numeric(gsub("[\\$,]", "", Top10$Tuition.and.fees))
sum(Top10$tuition)/10 