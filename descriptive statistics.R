# creating descriptive statistics


#set the working directory
setwd("/home/hectorceja/R-practica")

#read a csv data file
cars <- read.csv("Cars.csv")
cars

# create a frequency table
table(cars$Transmission)

#GET THE MIMIMUM VALUE
min(cars$Fuel.Economy)


#get the maximum value
max(cars$Fuel.Economy)

#get the average value
mean(cars$Fuel.Economy)

#get the median value
median(cars$Fuel.Economy)

#get the quartiles
quantile(cars$Fuel.Economy)

#get the stardard desviation
sd(cars$Fuel.Economy)

#get the total value
sum(cars$Fuel.Economy)

#get the correlation coefficient
cor(
  x = cars$Cylinders,
  y = cars$Fuel.Economy
)

#summarize an entire table
summary(cars)

