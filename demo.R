#asignar valores
x <- "hello world"
y = "hello world"
"hello world" -> z

#implicit printing
x
print(x)

#creating variables
l <- TRUE
i = 123L
n = 1.23
c <- "ABC 123"
d <- as.Date("2018-04-04")

#creating a function
f <- function(x) {x + 1}
#invoking a function
f(2)

# creating a vector 'c' is a concatenationfunction
v <- c(1, 2, 3)
v

#creating a sequence
s<- 1:10
s

# creating a matrix
m <- matrix(
  data = 1:6,
  nrow = 3,
  ncol = 3
)
m
 
# creating an array
a <- array(
  data = 1:8,
  dim = c(2, 2, 2))
a

#creating a list
l <- list(TRUE, 123L, 2.34, "ABC")
l

# creating a factor
categories <- c("Male", "Female", "Male", "Male")
factor <- factor(categories)
factor
levels(factor)
unclass(factor)

#creating a data frame
df <- data.frame(
  Name = c("Cat", "Dog","Cow","Pig"),
  HowMany = c(5,10,5,10),
  IsPet = c(TRUE, TRUE, FALSE, FALSE)
)
df
# indexing data fraes by row and column
df[1,2]
 
# indexing data frames by row
df[1,]

# indexing data frames by column
df[,2]
df[["HowMany"]]
df$HowMany

#subsetting data frames
df[c(3,4),]
df[2:4,]
df[c(TRUE, FALSE, TRUE, FALSE)]
df[df$IsPet == TRUE,]
df[df$HowMany >= 10,]
df[df$Name %in% c("Cat","Cow"),]

#R is a vectorized language
1+2
c(1,2,3) + c(2,4,6)

#Named vs ordered arguments
m <- matrix(data = 1:6, nrow = 2, ncol=3) 
n <- matrix(1:6, 2,3)
m == n
identical(m,n)

#installing packages
install.packages("dplyr")

#loading packages
library("dplyr")

#viewing help
?data.frame





