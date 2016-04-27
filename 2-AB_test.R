
###
## Scenario:   Comparing pages visited in an A/B test
##
## Statistics: Descriptive statistics, independent-samples t-test
###

## Independent-samples t-test

# read in a data file with page views from an A/B test
timeonsite = read.csv("timeonsite.csv")
View(timeonsite)
timeonsite$Subject = factor(timeonsite$Subject) # convert to nominal factor
summary(timeonsite)

# descriptive statistics by Site
library(plyr)
ddply(timeonsite, ~ Site, function(data) summary(data$Time))
ddply(timeonsite, ~ Site, summarise, Time.mean=mean(Time), Time.sd=sd(Time))

# graph histograms and a boxplot
hist(timeonsite[timeonsite$Site == "A",]$Time)
hist(timeonsite[timeonsite$Site == "B",]$Time)
plot(Time ~ Site, data=timeonsite)

# independent-samples t-test
t.test(Time ~ Site, data=timeonsite, var.equal=TRUE)


