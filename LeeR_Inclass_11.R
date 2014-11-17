
# Ronald Lee
# CMDA 3654
# Inclass 11

################################
#Inclass 11_1
################################

setwd('C:\\Users\\Ronald\\Documents\\VT\\2014 Fall\\STAT 3654 - Intro Data Analytics & Visual\\Assignments\\Lecture34')


data(mtcars)

head(mtcars)
names(mtcars)
?mtcars

# mpg : Miles/(US) gallon
# cyl : Number of cylinders
# disp : Displacement(cu.in.)
# hp : Gross horsepower
# drat : Rear axle ratio
# wt : Weight (lb/1000)
# qsec : 1/4 mile time
# vs : V/S
# am : Transmission (0 = automatic, 1 = manual)
# gear : Number of forward gears
# carb : Number of carburetors

library(rpart)

head(mtcars$am)
mtcars$response <- mtcars$am > 0
head(mtcars$response)


#a = response ~ mpg + cyl + disp + hp + drat + wt + qsec + vs + am + gear + carb
#a

e <- paste('response ~ ',paste(selVars,collapse=' + '),sep='')
e

emodel <- rpart(a,data=mtcars,
                control=rpart.control(cp=0.001,minsplit=4,
                                      minbucket=4,maxdepth=5))
emodel

library(rpart.plot)
prp(emodel)

# Since the value of am is either 0 or 1, the decision tree says that if am < 0.5 then am = 0 otherwise am = 1.
# If am = 0, then it is automatic. If am = 1, then it is manual.
library(ROCR)

mtcars$pred <- predict(emodel, newdata = mtcars)
head(mtcars$pred)
eval1 <- prediction(mtcars$pred, mtcars$response)

auc_calc1 <- performance(eval1,'auc')
auc_calc1@y.values

# AUC = 1
# This is the perfect model. 

plot(performance(eval1, "tpr", "fpr"))

# The area under the curve AUC is 1, which is the maximum we can have so we got a good model.

############################
# Inclass 11_2
############################


################kNN algo

knnTrain <- dTrain[,selVars]
names(knnTrain)

response <- mtcars$am > 0

head(response)
head(knnTrain)
dim(knnTrain)

library(class)

system.time(knnDecision1 <- knn(knnTrain,knnTrain,response,k=10,prob=T))

# user time 67.53 sec

head(knnDecision1)

knnPred1 <- ifelse(knnDecision1==TRUE,
                  attributes(knnDecision1)$prob,
                  1-(attributes(knnDecision1)$prob))
head(knnPred1)

#calculate AUC
library(ROCR)
eval2 <- prediction(knnPred1, response) #from ROCR package
auc_calc2 <- performance(eval2,'auc')
auc_calc2@y.values 

# AUC = 86.32 %

#################Logistic algo


f <- paste('response ~ ',paste(selVars,collapse=' + '),sep='') #create formula
system.time(gmodel <- glm(as.formula(f),
                          data=knnTrain,
                          family=binomial(link='logit'))) #get system time and train the model
# user time 0.82 sec

log_predict <- predict(gmodel, 
                       newdata=knnTrain, 
                       type = "response") #get p predictions

eval3 <- prediction(log_predict, response) #from ROCR package
auc_calc3 <- performance(eval3,'auc')
auc_calc3@y.values #special object; this is how we extract the exact AUC part

# AUC = 73.75 %


### comparison between KNN and Logistic algorithm
# KNN algo takes a long time, 67 sec, to figure out, but it gives 86 % of AUC which is high percentage
# Logistic algo takes very short time, 0.82 sec, but it gives 73 % of AUC which is high percentage but lower than KNN algo.
# I think KNN algo is better than Logistic algo since it gives high percentage of AUC even though it takes time.


##########################
# Inclass 10_3
##########################


###########CART algo

library(rpart)
g <- paste('response ~ ',paste(selVars,collapse=' + '),sep='')
system.time(tmodel <- rpart(g,data=mtcars,
                            control=rpart.control(cp=0.001,minsplit=4,
                                                  minbucket=4,maxdepth=5)))

# user time 2.15 sec 

mtcars$pred <- predict(tmodel, newdata = mtcars)
mtcars$response <- mtcars$am > 0

eval4 <- prediction(mtcars$pred, mtcars$response) 
auc_calc4 <- performance(eval4,'auc')
auc_calc4@y.values

# AUC = 1

# CART algo takes a short time, 2.15 sec, and also get 100 % of AUC. 
# Therefore, this is the best algorithm to use. 




