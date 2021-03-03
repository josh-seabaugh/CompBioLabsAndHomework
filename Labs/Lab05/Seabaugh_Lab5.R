# Josh Seabaugh
# EBIO 5420
# Lab 5, week 6,7

# Clear workspace
rm(list = ls())

# Set the working directory
setwd("~/Documents/EBIO_5420_CompBio/CompBioLabsAndHomework/Labs/Lab05")

# PART I
# lab step #1: simple if statement
x <- 22
threshold <- 5

if ( x > threshold ) {
  print(paste("x is larger than",threshold))
} else {
  print(paste("x is smaller than or equal to",threshold))
}

# lab step #2: reading in the data
data <- read.csv("ExampleData.csv") # read in the data as a dataframe
dataVector <- data$x # make a vector out of the single column of the dataframe

# lab step #2a: changing negative values to NA
for ( value in 1:length(dataVector) ) {
  if ( dataVector[value] < 0 ) {
    dataVector[value] <- NA
  }
}

# lab step #2b: changing NA values to NaN
logicalValues <- is.na(dataVector)
dataVector[logicalValues] <- NaN

# lab step #2c: changing NA values to NaN
dataVector[which(is.nan(dataVector))] <- 0

# lab step #2d: find how many data points fall in the range 50-100 (inclusive)
length(which(dataVector >= 50 & dataVector <= 100))

# lab step #2e: creating a vector of the data points in the range 50-100
FiftyToOneHundred <- dataVector[which(dataVector >= 50 & dataVector <= 100)]

# lab step #2f: saving the new vector
write.csv(x = FiftyToOneHundred, file = "FiftyToOneHundred.csv")

# lab step #3: importing data on CO2 emissions
# read in the data as a dataframe
CO2Data <- read.csv("~/Documents/EBIO_5420_CompBio/CompBioLabsAndHomework/Labs/Lab04/CO2_data_cut_paste.csv") 

# lab step #3a: find the first year that data on gas emissions were non-zero
rowsOfNonZeroGasEmissions <- which(CO2Data$Gas != 0)
firstYear <- CO2Data$Year[rowsOfNonZeroGasEmissions[1]]

# lab step #3b: find the years that total emissions were between 200 and 300
# metric tons of carbon
Years <- CO2Data$Year[which(CO2Data$Total >= 200 & CO2Data$Total <= 300)]


# PART II - Predator-Prey interactions
# Setting up parameters (taken from the Lab05 instructions)
totalGenerations <- 1000
initPrey <- 100 	# initial prey abundance at time t = 1
initPred <- 10		# initial predator abundance at time t = 1
a <- 0.01 		# attack rate
r <- 0.2 		# growth rate of prey
m <- 0.05 		# mortality rate of predators
k <- 0.1 		# conversion constant of prey into predators

# set up a time vector
time <- seq(1:totalGenerations)

# make vectors to store the result over time
n <- rep(0, totalGenerations) # abundance of prey 
n[1] <- initPrey
p <- rep(0, totalGenerations) # abundance of predators
p[1] <- initPred

# create a for loop that performs the calculations
for ( t in 2:totalGenerations ) {
  n[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1])
  p[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1])
  if ( n[t] < 0 ) {
    n[t] <- 0
  }
  if ( p[t] < 0 ) {
    p[t] <- 0
  }
}

# make a plot of prey and predator abundance over time
plot(time, n, col = "green", main = "Abundance of prey and predators over time",
     ylab = "Abundance")
lines(time, p, col = "blue")
legend(600, 600, legend = c("Prey in green", "Predators in blue"))

# make a results matrix
myResults <- matrix(c(time, n, p), nrow = totalGenerations, ncol = 3)
colnames(myResults) <- c("TimeStep", "PreyAbundance", "PredatorAbundance")

# write the results matrix into a csv
write.csv(x = myResults, file = "PredPreyResults.csv")



