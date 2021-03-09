# Josh Seabaugh
# EBIO 5420
# Lab 7, week 8

# Clear workspace
rm(list = ls())

# Set the working directory
setwd("~/Documents/EBIO_5420_CompBio/CompBioLabsAndHomework/Labs/Lab07")

# Problem #1: write a function that computes the area of a triangle
# Define the function:
triangleArea <- function(base, height) {
  area = 0.5 * base * height # calculate the area
  return(area)
}

# Test the function:
# a triangle with base of 10 and height of 9
triangleArea(10, 9)

# Problem #2 write a function that calculates absolute values
myAbs <- function(values) {
  for ( i in 1:length(values) ) {
    if ( values[i] < 0 ) {
      values[i] <- -1 * values[i]
    }
  }
  return(values)
}

# Test the function:
# the number 5, the number -2.3 and the vector c(1.1, 2, 0, -4.3, 9, -12)
myAbs(5)
myAbs(-2.3)
myAbs(c(1.1, 2, 0, -4.3, 9, -12))

# Problem #3: Fibonacci function
# Define the function:
fibonacci <- function(n, start) {
  fibSeq <- start # initialize the first value to 1
  fibSeq[2] <- 1 # initialize the second value to 1
  if ( is.wholenumber(n) == F | is.wholenumber(start) == F | n <= 0 |
       start < 0 | start > 1) {
    print("Error: Invalid input") # print error message
  } else if ( n == 1 ) {
    return(start)
  } else if ( n == 2 ) {
    return(fibSeq)
  } else {
    for ( i in 3:n ) {
      fibSeq[i] <- fibSeq[i-2] + fibSeq[i-1] # Calculate the fibonacci sequence
    }
    return(fibSeq)
  }
}

# Test the function:
fibonacci(10, 1)
fibonacci(10, 0)
fibonacci(1, 0)
fibonacci(2, 1)
fibonacci(-1, 0) # test invalid input
fibonacci(0, 1) # test invalid input

# Problem 4a: square of the difference
# Define the function:
squareOfDiff <- function(vector, n) {
  result <- (vector - n) ^ 2 # calculate the square of the difference
  return(result)
}

# Test the function
squareOfDiff(3, 5)
squareOfDiff(c(2, 4, 6), 4)

# Problem 4b: average function
# Define the function:
average <- function(vector) {
  result <- sum(vector) / length(vector) # calculate the arithmetic mean
  return(result)
}

# Test the function:
average(c(5, 15, 10))
data <- read.csv("DataForLab07.csv")
average(data$x)

# Problem 4c: sum of squares
# Define the function:
sumOfSquares <- function(vector) {
  ave <- average(vector)
  result <- sum(squareOfDiff(vector, ave)) # calculate the sum of squares
  return(result)
}

# Test the function:
sumOfSquares(data$x)

