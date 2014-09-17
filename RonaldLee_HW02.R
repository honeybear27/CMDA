
# 1.

getwd()
setwd("C:\\Users\\Ronald\\Documents\\VT\\2014 Fall\\STAT 3654 - Intro Data Analytics & Visual\\Assignments")


load("phsample.RData")


# 2. There are 2 datasets. One has 2982 observations of 210 variables and another one has 6279 observations of 288 variables.

# 3.

psub = subset(dpus,with(dpus,(PINCP>1000)&(ESR==1)&
                          (PINCP<=250000)&(PERNP>1000)&(PERNP<=250000)&
                          (WKHP>=40)&(AGEP>=20)&(AGEP<=50)&
                          (PWGTP1>0)&(COW %in% (1:7))&(SCHL %in% (1:24))))

# 4. 2.12 code : This code sorts the dpus dataset with conditions that PINCP > 1000, ESR ==1, PINCP <= 250000
#               PERNP >1000, PERNP<=250000, WKHP>=40, AGEP>=20,AGEP<=50, PWGTP1>0, 1<= COW <=7, and 1<= SCHL <=24.



psub$SEX = as.factor(ifelse(psub$SEX==1,'M','F'))
psub$SEX = relevel(psub$SEX,'M')
cowmap <- c("Employee of a private for-profit",
            "Private not-for-profit employee",
            "Local government employee",
            "State government employee",
            "Federal government employee",
            "Self-employed not incorporated",
            "Self-employed incorporated")
psub$COW = as.factor(cowmap[psub$COW])
psub$COW = relevel(psub$COW,cowmap[1])
schlmap = c(
  rep("no high school diploma",15),
  "Regular high school diploma",
  "GED or alternative credential",
  "some college credit, no degree",
  "some college credit, no degree",
  "Associate's degree",
  "Bachelor's degree",
  "Master's degree",
  "Professional degree",
  "Doctorate degree")
psub$SCHL = as.factor(schlmap[psub$SCHL])
psub$SCHL = relevel(psub$SCHL,schlmap[1])
dtrain = subset(psub,ORIGRANDGROUP >= 500)
dtest = subset(psub,ORIGRANDGROUP < 500)
    
# 4. 2.13 : Reencode sex, class of worker info, and education info. Assign subset of data rows used for model training to new variables.


summary(dtrain$COW)
Employee of a private for-profit Federal government employee
423 21
Local government employee Private not-for-profit employee
39 55
Self-employed incorporated Self-employed not incorporated
17 16
State government employee
24

# 4. 2.14 : Summary of the classifications of work

# 5. We are going to start with NBA statistic dataset. We choose top 60 nba players with points sections
# and the dataset has 7 variables, which are GP(game played), MIN(playtime), PTS(points), FGM(field goal made),
# FGA(field goal attempted), FG%(field goal percentage), 3FGM(3points field goal made)

# 6. 

getwd()
setwd("C:\\Users\\Ronald\\Documents\\VT\\2014 Fall\\STAT 3654 - Intro Data Analytics & Visual\\Assignments")

HW02 <- read.table('HW 02.csv', sep=',', header=T)

tail(HW02)

dim(HW02)
var1 <- HW02[2,3]
var1
var2 <- HW02[10,4]
var2

HW02[,1]

HW02[1:2,1:2]

Name <- HW02[,2] 
Name

HW02[15,]   


HW02[HW02$NE == 1,] #extracts only rows where NE is 1

names(HW02)

attach(HW02)

summary(HW02)

summary(PTS)

plot(PTS,AST)
plot(PTS,REB)

#detach dataset; variables not directly accesible anymore
detach(HW02)
PTS
HW02$PTS
HW02[,3]

# 7. pdf file

