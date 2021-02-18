# Josh Seabaugh
# EBIO 5420
# Lab 4, week 5

# PART I
# lab step #1: for loop that prints "hi"
num = 10 # number of times to print "hi"

for ( i in 1:num ) {
  print("hi")
}

# lab step #2: Tim's piggy bank
piggyBank <- 10 # dollars
allowance <- 5 # dollars per week
gumCost <- 2 * 1.34 # cost of 2 packs of gum per week
weeks <- 1:8 # number of weeks

for ( i in weeks ) {
  piggyBank <- piggyBank + allowance - gumCost
  print( piggyBank )
}

# lab step #3: Population size
percent = 0.05 # population shinkage per year
current_size = 2000 # current population size
years <- 1:7 # number of years of the study

for (i in years ) {
  current_size = current_size * (1 - percent)
  print(current_size)
}

# lab step #4: logistic growth
r = 0.8 # intrinsic growth rate
K = 10000 # carrying capacity
steps <- 2:12 # number of steps

n <- rep(0, 12) # pre-allocated vector to store abundance data
n[1] = 2500 # abundance at t = 1

for ( t in steps ) {
  n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K ) # discrete logistic growth eq.
  print(n[t])
}
print("The abundance at time n[12]:")
print(n[12])

# PART II
# lab step #5a: using rep()
vectorA <- rep(0, 18)

# lab step #5b: loop that stores 3x the iterator
for ( i in seq(1,18) ) {
  vectorA[i] <- 3 * i 
}
print(vectorA)

# lab step #5c: uisng rep() again
vectorB <- rep(0, 18)
vectorB[1] <- 1

# lab step #5d: one plus twice loop
for ( i in 2:length(vectorB) ) {
  vectorB[i] <- 1 + (2 * vectorB[i - 1])  
}
print(vectorB)

# lab step #6: Fibonacci sequence
fibSeq <- rep(0, 20) # pre-allocated vector to store the Fibonacci sequence
fibSeq[2] <- 1 # initialize the second value to 1
for ( i in 3:length(fibSeq) ) {
  fibSeq[i] <- fibSeq[i-2] + fibSeq[i-1]
}
print(fibSeq)

# lab step #7: plotting time and abundance from step #4
abundance <- n # the abundance values were already stored in vector n from step#4
time <- 1:12 # time steps
plot(time, abundance)

# lab step #8a: setting the working directory and reading the data
setwd("~/Documents/EBIO_5420_CompBio/CompBioLabsAndHomework/Labs/Lab04")
read.csv("CO2_data_cut_paste.csv")

# lab step #8b: converting "integer" types to "numeric" types

# Method 1: Using the correct option in read.csv()
mydata <- read.csv("CO2_data_cut_paste.csv", colClasses=c('integer','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

# Method 2: Using a for loop
numColumns <- length(mydata) # number of columns in mydata
for ( i in 2:numColumns ) {
  for ( ii in 1:nrow(mydata[i])) {
    mydata[ii,i] <- as.numeric(mydata[ii,i])
  }
}

# lab step #8c: DID NOT FINISH THIS PART
