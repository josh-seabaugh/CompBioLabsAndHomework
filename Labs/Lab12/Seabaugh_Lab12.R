# Josh Seabaugh
# EBIO 5420
# Lab 12

# Clear workspace
rm(list = ls())

# Load libraries
library("dplyr")
library("ggplot2")
library("lubridate")

# Working with some data from the Colorado Department of Public Health
# and Environment (CDPHE) on COVID-19 in Colorado.

setwd("/Users/joshseabaugh/Documents/EBIO_5420_CompBio/CompBioLabsAndHomework/Labs/Lab12")

stateStatsData <- read.csv("CDPHE_COVID19_Daily_State_Statistics_2_2021-04-02.csv", 
                           stringsAsFactors = F)

# Part 1: Getting the data into shape
# Using one pipeline:
dt <- as.Date("2020-05-15") # set the date threshold

ColoradoData <- stateStatsData %>%
  filter( Name == "Colorado" ) %>%
  select(Date, Cases, Deaths) %>%
  mutate( Date = as.POSIXct(strptime(Date, format = "%m/%d/%Y", tz = ""))) %>% #using mutate to focus on one column
  arrange(Date) %>%
  filter( Date < dt )

# Part 2: Plotting the data
# Plot the cases over time
casesPlot <- ggplot(data = ColoradoData, aes(x = Date, y = Cases)) + 
  geom_line() + scale_y_continuous(trans='log10')

# Plot the deaths over time
ggplot(data = ColoradoData, aes(x = Date, y = Deaths)) + 
  geom_line() + scale_y_continuous(trans='log10')


# Part 3: Adding doubling times
addDoublingTimeRefLines <- function( myPlot, doublingTimeVec, data, targetColumn, startFrom, endFrom ) {
  initial <- data$targetColumn[ startFrom ]
  for ( i in 1:length(doublingTimeVec) ) {
    timePoints <- seq(from = startFrom, 
                      to = endFrom,
                      by = doublingTimeVec[i])
    doublingEvents <- 0:(length(timePoints) - 1)
    DoubleNums <- 2^(doublingEvents) * initial 
    ReferenceData <- data.frame(timePoints, DoubleNums)
    myPlot <- myPlot + ggplot(ReferenceData, aes(x = timePoints, y = DoubleNums)) + 
      geom_point() + 
      geom_line() + 
      scale_y_log10()
  }
  
  myPlot
}

# I tested the function using the following function call:
addDoublingTimeRefLines(casesPlot, 2, ColoradoData, Cases, 1, length(ColoradoData$Date))

# However, I keep getting this error:
# Error in data.frame(timePoints, DoubleNums) : 
#  arguments imply differing number of rows: 30, 0 

# I cannot figure out why...



