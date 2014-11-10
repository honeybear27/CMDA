

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


###############################
# Inclass 10_2
###############################


kmeans_clusters1 <- kmeans(distance1, 3 , nstart=100, iter.max=100)

kmeans_clusters1
kmeans_clusters1$cluster
kmeans_clusters1$centers

kmeans_clusters1$withinss
kmeans_clusters1$tot.withinss
kmeans_clusters1$betweenss

kmeans_clusters1$size

compare1 <- cbind(groups1,kmeans_clusters1$cluster)
compare1 <- as.data.frame(compare1)
names(compare1) <- c("Hierarchical", "kmeans")
compare1 <- cbind(iris$Species,compare1)
compare1

compare2 <- compare1[order(compare1$Hierarchical),]
compare2
compare3 <- compare1[order(compare1$kmeans),]
compare3

# Both hierarchical algorithm and k-means algorithm group the components in similar way.
# The number of cluster for each hierarchical and k-means is different each other, but they separate the 
# similar components into 3 clusters.
# The first cluster is composed by all setosa for both methods.
# The second cluster is composed only by virginica.
# The third cluster is composed by both virginica and versicolor.
# Both first cluster and the second cluster are almost perfectly separated,
# but I don't think the third cluster is separated perfectly since there are both versicolor and virginica 
# in the cluster.

##############################
# Inclass 10_3
##############################

species <- "setosa"
newpt1 <- cbind(5.0, 3.3, 1.4, 0.2)
newpt1 <- as.data.frame(newpt1)
names(newpt1) <- names(features1)
newpt1

newpt_sc1 <- (newpt1 - means1)/stdv1
newpt_sc1


species <- kmeans_clusters1$centers


dist11 <- sqrt(sum((newpt_sc1 - species[1,])^2))
dist11

dist22 <- sqrt(sum((newpt_sc1 - species[2,])^2))
dist22

dist33 <- sqrt(sum((newpt_sc1 - species[3,])^2))
dist33




