##########################
# Inclass 10_3_shiny
##########################

data(iris)


names(iris)
head(iris)
summary(iris)

library(shiny)
runApp("App_3")

names(iris)
iris1 <- scale(iris[,-5])
iris1 <- as.data.frame(iris1)
names(iris1)
label_points1 <- iris[,5]
label_points1
