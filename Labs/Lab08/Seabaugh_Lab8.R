# Josh Seabaugh
# EBIO 5420
# Lab 8, week 9

# Clear workspace
rm(list = ls())

# Set the working directory
setwd("~/Documents/EBIO_5420_CompBio/CompBioLabsAndHomework/Labs/Lab08")

# lab step #3: Discrete-time logistic growth model function
# Define the function:
growthModel <- function(r, K, generations, initPop) {
  n <- rep(0, generations) # pre-allocated vector to store abundance data
  n[1] = initPop # abundance at t = 1
  
  for ( t in 2:generations ) {
    n[t] <- n[t-1] + ( r * n[t-1] * (K - n[t-1])/K ) # discrete logistic growth eq.
    print(n[t])
  }
  
  abundance <- n # make an abundance vector from the population values
  time <- 1:generations # set a time vector for the plot
  
  plot(time, abundance) # plot abundance vs time
  title("Abundance over Time")
  
  # Write the data to a file
  generations <- time # rename the time vector to "generations"
  data <- data.frame(generations, abundance)
  write.csv(data, file = "DiscreteLogisticGrowthResults.csv")
}

# Test the function:
growthModel(0.8, 10000, 12, 2500)
growthModel(0.3, 8000, 100, 100)
growthModel(0.1, 8000, 100, 10)



