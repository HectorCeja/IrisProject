#working with data


#set the working directory
setwd("/home/hectorceja/R-practica")

#read a tab-delimited data file
cars = read.table(
  file = "Cars.txt",
  header = TRUE,
  sep = "\t",
  quote = "\""
)
cars
#peek at the data
head(cars)

#load the library
library(dplyr)

#select a subset of columns
temp <- select(
  .data = cars,
  Transmission,
  Cylinders,
  Fuel.Economy
)

#inspect the results
head(temp)


# filter a subset of rows
temp <- filter(
  .data = temp,
  Transmission == "Automatic"
)
#inspect the results
head(temp)

#compute a new column
temp <- mutate(
  .data = temp,
  Consumption = Fuel.Economy * 0.425
)

head(temp)

#group by a column
temp <- group_by(
  .data = temp,
  Cylinders
)

head(temp)

#aggregate based on groups
temp <- summarise(
  .data = temp,
  Avg.Consumption = mean(Consumption)
)
head(temp)

#arrange the rows in descending order
temp <- arrange(
  .data = temp,
  desc(Avg.Consumption)
)

head(temp)

#convert to data frame
efficiency <- as.data.frame(temp)
print(efficiency)

#chain methods together
efficiency <- cars %>%
  select(Fuel.Economy, Cylinders, Transmission) %>%
  filter(Transmission == "Automatic") %>%
  mutate(Consumption = Fuel.Economy * 0.425) %>%
  group_by(Cylinders) %>%
  summarize(Avg.Consumption = mean(Consumption)) %>%
  arrange(desc(Avg.Consumption)) %>%
  as.data.frame()

print(efficiency)

#save the results
write.csv(
  x = efficiency,
  file = "Fuel Efficiency.csv",
  row.names = FALSE
)












