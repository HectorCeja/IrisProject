# creating data visualization


#set the working directory
setwd("/home/hectorceja/R-practica")

#read a csv data file
cars <- read.csv("Cars.csv")
cars

#install library
install.packages("ggplot2")
#load the ggplot2 library
library(ggplot2)

#creating a frequency bar chart
ggplot(
  data = cars,
  aes( x = Transmission)) +
  geom_bar() +
  ggtitle("Count of Cars by Transmission Type") +
  xlab("Transmission Type") +
  ylab("Count of Cars")

#creating a histogram
ggplot(
  data = cars,
  aes(x = Fuel.Economy)) +
  geom_histogram(
  bins = 10) +
  ggtitle("Distribution of Fuel Economy") +
  xlab("Fuel Economy (mpg)") +
  ylab("Count of Cars")

#creating a density plot
ggplot(
  data = cars,
  aes(x = Fuel.Economy)) +
  geom_density()+
  ggtitle("Distribution of Fuel Economy") +
  xlab("Fuel Economy (mpg)") +
  ylab("Density")

#creating a scatterplot
ggplot(
  data = cars,
  aes(
    x = Cylinders,
    y = Fuel.Economy)) +
  geom_point()+
  ggtitle("Fuel Economy by Cylinders") +
  xlab("Number of Cylinders") +
  ylab("Fuel Economy (mpg)")


