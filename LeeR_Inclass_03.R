# Ronald Lee
# STAT 3654 
# Inclass #3


getwd()
setwd("C:\\Users\\Ronald\\Documents\\VT\\2014 Fall\\STAT 3654 - Intro Data Analytics & Visual\\Assignments")

load('exampledata1.rdata')

summary(custdata)

c <- custdata[c("income")]
summary(c)

summary(medianincome)
e<- medianincome[c("Median.Income")]
summary(e)

norm.income<-merge(c, e)
norm.income

norm.income$income

summary(norm.income$income)
meanage <- mean(norm.income$income)
norm.income$income.normalized <- norm.income$income/meanage
summary(norm.income$income.normalized)


testSet <- subset(norm.income, norm.income$income.normalized <= 0.7)
trainingSet <- subset(norm.income, norm.income$income.normalized > 0.7)









set drive??? 
load data
merge 
meanage < - income / median income
summary(meanage)
???? morassunguhya

