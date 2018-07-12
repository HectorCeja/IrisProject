# handling big data


#set the working directory
setwd("/home/hectorceja/R-practica")

install.packages("ff")

library(ff)

#read a csv file as ff data frama
irisff <- read.table.ffdf(
  file = "Iris.csv",
  FUN = "read.csv"
)

#inspect the element
class(irisff)

#inspect the column names
names(irisff)

#inspect the first few rows
irisff[1:5,]

install.packages("biglm")

library(biglm)

#create a linear regression model
model <- biglm(
  formula = Petal.Width ~ Petal.Length,
  data = irisff
)

summary(model)

#create a scatterplot
plot(
  x = irisff$Petal.Length[],
  y = irisff$Petal.Width[],
  main = "Iris Petal Length vs Width",
  xlab = "Petal Length(cm)",
  ylab = "Petal Witdh (cm)"
)

#get y-intercept from model
b <- summary(model)$mat[1,1]

#get slope from model
m <- summary(model)$mat[2,1]

#draw a  regression line
lines(
  x = irisff$Petal.Length[],
  y = m * irisff$Petal.Length[] + b,
  col = "red",
  lwd = 3
)

#predict new values with the model
predict(
  object = model,
  newdata = data.frame(
    Petal.Length = c(2,5,7),
    Petal.Width = c(0,0,0)
  )
)
