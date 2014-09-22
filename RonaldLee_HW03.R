#Ronald Lee
#Homework 03
#CMDA 3654
# 9 / 22 / 14


#Problem 1

getwd()
setwd("C:\\Users\\Ronald\\Documents\\VT\\2014 Fall\\STAT 3654 - Intro Data Analytics & Visual\\Assignments")

nba<-read.table('FinalProject.csv', sep=',', header=T)
nba

#Problem 2
#The numeric variables include Game played(GP), Minutes played(MIN), Points scored(PTS),
#Field goad made(FGM), Field goad attempted(FGA), and Field goal percentage(FG%)
#Player name and team name are factor variables.

#Problem 3, 4

summary(nba$GP)
#our summary yields a minimum of 62 games and maximum of 82 games. 25% of the top 60 players played 
#in at least 72.75 games, 50% of top players played in at least 77 games, and 75% of top players played 
#in at least 80 games. On average, the top 60 players played in 75.85 games.
summary(nba$PTS)
#our summary yields a minimum of 1096 points and maximum of 2593 points. 25% of the top 60 players 
#scored at least 1238 points, 50% of top players scored at least 1301 points, and 75% of top players
#scored at least 1566 points. On average, the top 60 players scored 1422 points.

library(ggplot2)
ggplot(nba, aes(x=GP,y=PTS)) +
  geom_point() +
  ylim(1000,3000) +
  theme_bw() +
  ggtitle("Scatterplot of Games Played vs Points")
cor(nba$GP,nba$PTS)
#the value of correlation is 0.2202007, indicating a weak positive relationship, as evidenced 
#via the scatterplot of Games Played vs Points - the graph shows a positive trend. 





summary(nba$MIN)

#The minimum minutes played of 60 players we choose is 1810, and the max is 3122.
#25% of the players played 2410 minutes, 50% of the players played 2554 minutes,
#and 75% of the players played 2786 minutes.
#The average minutes played of 60 players is 2574 minutes.

summary(nba$FG.)

#The minimum field goad percentage is 37.30%, and the maximum percentage is 59.10%
#25% of the players record 42.98%, 50% of the players record 45.45%,
#and 75% of the players record 49.15%.
#The average field goal percentage of 60 players is 46.16%.

library(ggplot2)

ggplot(nba, aes(x=MIN,y=FG.)) +
  geom_point() +
  ylim(30,70) +
  theme_bw() +
  ggtitle("Scatterplot of Minutes Played vs Field Goal Percentage")

cor(nba$MIN, nba$FG.)

#The value of correlation, -0.1025623, shows a very weak negative relationship
#via the scatterplot of Minutes Played vs Field Goal Percentage.
#It doesn't look like they have any relationship.




summary(nba$GP)
#The minimum amount of games played from the players we chose is 62, and the max is 82
#The average player in our set played about 76 games
#25% of our players played in 73 games or less, and 75% played 80 or less
summary(nba$PTS)
#Each player in our set has a minimum of 1096 points and maximum of 2593 points.
#25% of the top 60 players scored less than or equal to 1238 points, and
#75% of players played up to 1566 points.
#The average for our set is 1422
summary(nba$FGM)
#The maximum made by the top 60 players is 849, and we will see that percentage in the
#FG% summary. The top 25% scored at least 564, but the lower 25% made 447 or less
#Exactly half of the data made 483 shots or less, but the average was 516.
summary(nba$FGA)
#The most field goals attempted by the top 60 players is 1688
#The average was 1067. The bottom 25% attempted 992 or less
#and the top 25% shot at elast 1262

library(ggplot2)
ggplot(nba, aes(x=GP,y=PTS)) +
  geom_point() +
  ylim(1000,3000) +
  theme_bw() +
  ggtitle("Scatterplot of Games Played vs Points")
cor(nba$GP,nba$PTS)
#the value of correlation is 0.2202007, indicating a weak positive relationship, as evidenced 
#via the scatterplot of Games Played vs Points - the graph shows a positive trend. 

library(ggplot2)
ggplot(nba, aes(x=FGA,y=FGM)) +
  geom_point() +
  ylim(300, 900) +
  theme_bw() +
  ggtitle("Scatter plot of Field Goals Attempted vs. Field Goals Made")
cor(nba$FGM, nba$FGA)
#The scatterplot shows us a positive relationship that appears linear.
#This shows us the more shots a player attempted, the more they generally made.
#The scatterplot results are proven by the correlation, which in this case was
#0.882, which tells us there is a strong positive relationship.
#I do not see any issues that stand out to me in this graph about our data
#that may indicate a need for a transformation


