
# Ronald Lee
# CMDA 3654
# Inclass 10

################################
#Inclass 10_1
################################


data(iris)


names(iris)
head(iris)
summary(iris)

features1 <- iris[1:4]
head(features1)

scaled_features1 <- scale(features1)
head(scaled_features1)

summary(scaled_features1)

means1 <- attr(scaled_features1,"scaled:center")
print(means1)
stdv1 <- attr(scaled_features1, "scaled:scale")
print(stdv1)

distance1 <- dist(scaled_features1, method = "euclidean")
print(distance1)

hier_cl1 <- hclust(distance1, method="ward")
hier_cl1

plot(hier_cl1, labels=iris$Species)

rect.hclust(hier_cl1, k=3)
groups1 <- cutree(hier_cl1, k = 3)
print(groups1)

# In first cluster, all components are from setosa.
# In second cluster, all components are from virginica.
# In third cluster, the components are composed both versicolor and virginica.
