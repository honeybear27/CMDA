

# Ronald Lee
# CMDA 3654
# Inclass 8_3

getwd()
setwd('C:\\Users\\Ronald\\Documents\\VT\\2014 Fall\\STAT 3654 - Intro Data Analytics & Visual\\Assignments')

data=load("fdata.RData")

attach(final)

model <- lm(ssc ~  som1 + som2 + som3 + som4 + som5 +som6 + som7 + som8 + som9 + som10 + som11 + som12 + som13 + som14)
summary(model)







