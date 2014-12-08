setwd("C:\\Users\\Ronald\\Documents\\VT\\2014 Fall\\STAT 3654 - Intro Data Analytics & Visual\\Final Project")
nba <- read.table('NBAdata(stats_wins).csv', sep=',', header=T)
nba
summary(nba$FG.)
#The minimum field goal percentage is 35.4% and the maximum percentage is 59.1%. 
#25% of the top 60 players scored a field goal percentage of 43.075%. 50% of
#the top 60 players scored a field goal percentage of 45.35%. 75% of the top 60 
#players scored 49.625%. The average field goal percentage of the top 60 players is 46.3%. 
summary(nba$REB)
#The minimum number of rebound is 2.3 per game and the maximum number of rebound is 12.5. 
#25% of the top 60 players had 3.5 rebounds per game. 50% had 4.7 rebounds per game and 75% had 7.025 
#rebounds per game. The average number of total rebounds of the top 60 players is 5.743. 
summary(nba$PTS)
#The minimum number of points of the top 60 players is 15.80 and the maximum number of points is 32. 
#25% of the top 60 players scored 17.17 points per game. 50% of the top 60 players scored 18.35 points 
#per game. 75% of the top 60 players scored at least 20.80 points per game. The average number of total points
#of the top 60 players is 19.47. 
summary(nba$TEAM)
#ATL BKN BOS CHA CHI CLE DAL DEN DET GSW HOU IND LAC LAL MEM MIA MIL MIN NOP NYK OKC ORL PHI PHX POR SAC SAS 
#3   2   1   2   1   3   2   1   1   3   3   1   3   2   2   3   1   3   2   1   2   1   2   3   3   3   1 
#TOR UTA WAS 
#2   1   2
#3 of the top 60 players is on ATL. 
#2 is on BKN
#1 is on BOS
#2 is on CHA
#1 is on CHI
#3 is on CLE
#2 is on DAL
#1 is on DEN
#1 is on DET
#3 is on GSW
#3 is on HOU
#1 is on IND
#3 is on LAC
#2 is on LAL
#2 is on MEM
#3 is on MIA
#1 is on MIL
#3 is on MIN
#2 is on NOP
#1 is on NYK
#2 is on OKC
#1 is on ORL
#2 is on PHI
#3 is on PHX
#3 is on POR
#3 is on SAC
#1 is on SAS
#2 is on TOR
#1 is on UTA
#2 is on WAS

##################################
#Scatterplots (for the 7 factors vs Wins)
setwd("C:\\Users\\Ronald\\Documents\\VT\\2014 Fall\\STAT 3654 - Intro Data Analytics & Visual\\Final Project")
nba <- read.table('NBAdata(stats_wins).csv', sep=',', header=T)
nba
library(ggplot2)

ggplot(nba, aes(x=FG.,y=WINS)) +
  geom_point() +
  stat_smooth(method = "lm")+
  ylim(0,70) +
  theme_bw() +
  ggtitle("Scatterplot of Field Goal Percentage Per Game vs Wins")
cor(nba$FG., nba$WINS) 
#The correlation between the factor field goal percentage and wins is 0.2852061, which is considered
#a weak and positive relationship.

ggplot(nba, aes(x=X3P.,y=WINS)) +
  geom_point() +
  stat_smooth(method = "lm")+
  ylim(0,70) +
  theme_bw() +
  ggtitle("Scatterplot of 3 Point Percentage Per Game vs Wins")
cor(nba$X3P., nba$WINS) 
#The correlation between 3point percentage and wins is 0.09216388, which is considered a very weak
#and positive relationship.

ggplot(nba, aes(x=FT.,y=WINS)) +
  geom_point() +
  stat_smooth(method = "lm")+
  ylim(0,70) +
  theme_bw() +
  ggtitle("Scatterplot of Free Throw Percentage Per Game vs Wins")
cor(nba$FT., nba$WINS) 
#The correlation between free throw percentage and wins is 0.1845638, which is considered a weak 
#and positive relationship. 

ggplot(nba, aes(x=REB,y=WINS)) +
  geom_point() +
  stat_smooth(method = "lm")+
  ylim(0,70) +
  theme_bw() +
  ggtitle("Scatterplot of Rebounds Per Game vs Wins")
cor(nba$REB, nba$WINS) 
#The correlation between rebounds and wins is -0.006843074, therefore no relationship exists between 
#these two factors

ggplot(nba, aes(x=AST,y=WINS)) +
  geom_point() +
  stat_smooth(method = "lm")+
  ylim(0,70) +
  theme_bw() +
  ggtitle("Scatterplot of Assists Per Game vs Wins")
cor(nba$AST, nba$WINS) 
#The correlation between assists and wins is 0.1818079, which is considered a weak and positive relationship.

ggplot(nba, aes(x=STL,y=WINS)) +
  geom_point() +
  stat_smooth(method = "lm")+
  ylim(0,70) +
  theme_bw() +
  ggtitle("Scatterplot of Steals Per Game vs Wins")
cor(nba$STL, nba$WINS) 
#The correlation between steals and wins is 0.04494763, which is considered a very weak and positive relationship.

ggplot(nba, aes(x=PTS,y=WINS)) +
  geom_point() +
  stat_smooth(method = "lm")+
  ylim(0,70) +
  theme_bw() +
  ggtitle("Scatterplot of Points Per Game vs Wins")
cor(nba$PTS, nba$WINS) 
#The correlation between points and wins is 0.2738458, which is considered a weak and positive 
#relationship.

########################
#number 6
getwd()
setwd("C:\\Users\\Ronald\\Documents\\VT\\2014 Fall\\STAT 3654 - Intro Data Analytics & Visual\\Final Project")

nba <- read.csv("NBAdata(stats_wins).csv", header = T)
head(nba)
nba$gp <- runif(dim(nba)[1])
testSet <- subset(nba, nba$gp <= 0.1)
trainSet <- subset(nba, nba$gp > 0.1)
rm(nba)
#package MASS has an implementation of the Stepwise regression
install.packages("MASS")
library(MASS)

attach(trainSet)
#first fit the linear regression with all features
fit <- lm(WINS ~ FG.+X3P.+FT.+REB+AST+STL+PTS)
summary(fit)
#then apply the stepwise procedure
step <- stepAIC(fit, direction = "both")
step
step$anova
rm(step)
rm(fit)
#And build the model with just the retained variables
fit1 <- lm(WINS ~ FG.+FT.+AST) 
summary(fit1)
detach(trainSet)
#our model is wins = -57.9705 + 1.2806FG% + 0.4379FT% + 1.3927AST
#Make predictions using the test set
testSet$winspred <- predict(fit1, newdata = testSet)
head(testSet)
#See how predicted wins compare to actual wins
library(ggplot2)
ggplot(data = testSet, aes(x = winspred, y = WINS)) +
  geom_point(color = "red")+
  geom_line(aes(x = WINS, y = WINS), color = "blue")
#Based on our plot, we see a poor prediction for the wins due to the lack of oberservations we have in 
#our testing set.
