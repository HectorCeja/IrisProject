#machine learning

data(iris)

#set a seed to make randomness reproducable
set.seed(42)

#rondomly sample 100 of 150 row indexes
indexes <- sample(
  x = 1:150,
  size = 100
)
indexes

#create a training set from indexes
train <- iris[indexes,]

#create a test set from remaining indexes
test <- iris[-indexes,]

#load the decision tree package
install.packages("tree")

library(tree)

#train a decision tree model
model <- tree(
  formula = Species ~ .,
  data = train
)

summary(model)

#visualize the decision tree model
plot(model)
text(model)

library(RColorBrewer)

#create a color palette
palette <- brewer.pal(3,"Set2")

#create a scatterplot colored by species
plot(
  x=iris$Petal.Length,
  y=iris$Petal.Width,
  pch=19,
  col = palette[as.numeric(iris$Species)],
  main = "Iris Petal Length vs. Width",
  xlab = "Petal Length (cm)",
  ylab = "Petal Width (cm)"
)
 

#plot the decision boundaries
partition.tree(
  tree = model,
  label = "Species",
  add = TRUE
)

#Predict with the model
predictions <- predict(
  object = model,
  newdata = test,
  type = "class"
)

#create a confusion matrix
table(
  x = predictions,
  y = test$Species
)

install.packages("caret")

library(caret)

#evaluate the prediction results
confusionMatrix(
  data = predictions,
  reference = test$Species
)

#set working directory
setwd("/home/hectorceja/R-practica")

#save the tree model
save(model, file ="Tree.RData")
