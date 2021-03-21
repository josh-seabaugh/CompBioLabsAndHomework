# Josh Seabaugh
# EBIO 5420
# Lab 8, week 9

# Clear workspace
rm(list = ls())

# Set the working directory
setwd("~/Documents/EBIO_5420_CompBio/CompBioLabsAndHomework/Labs/Lab09")

# Read in the data
camData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv",
                    stringsAsFactors = F)

# Problem 1: converting to date/time data types
# Convert the character date/time data to POSIXlt data types
camData$DateTime <- strptime(camData$DateTime, format = "%d/%m/%Y %H:%M")

# Problem 2: Finding which years were not converted correctly
# Find the years that were not converted properly
table(format(camData$DateTime, '%Y')) # Gives the number of years recorded as 2013, 2014, 0013 and 0014
badDates <- which(substring(camData$DateTime, 1, 2) == "00") # Finds the indices of all the incorrectly formatted years

# Problem 3: Create and accurate vector of dates and times
