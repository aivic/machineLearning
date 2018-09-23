library(ggfortify)
clust_data <- read.csv("../../datasets/clust.csv")

# Building k-means clustering model
model <- kmeans(clust_data[,2:3], 
                             centers = 6)  # number of clusters

model$centers

# visualizing the clusters
autoplot(model, clust_data[,2:3], frame = T)