# Josh Seabaugh
# EBIO 5420
# Lab 11

# Clear workspace
rm(list = ls())

# Load libraries
library("dplyr")
library("ggplot2")

# Set the working directory
setwd("~/Documents/EBIO_5420_CompBio/CompBioLabsAndHomework/Labs/Lab11")

# Read in the data
data <- read.csv("GlobalWoodDensityData.csv", stringsAsFactors = F)
colnames(data)[4] <- 'Density'

# Problem 4: Remove rows that contain missing data
# Find the row with missing data:
which(is.na(data$Density) == T)

# Remove the row with missing data:
data <- data[which(is.na(data$Density) == F),]

# Problem 5: Collapse the data set
SpeciesMeanDensity <- summarise(group_by(data, Binomial, Family), Density = mean(Density),
                                .groups = "drop")

# Problem 6: Contrasting family densities
# Make a new data frame set by Family
FamilyMeanDensity <- summarise(group_by(SpeciesMeanDensity, Family), Density = mean(Density),
                                .groups = "drop")

### Question: the above data frame has different mean densities for each Family than a data frame
### that uses the same summarise command but with "data" instead of "SpeciesMeanDensity".
### I assume this is because using "SpeciesMeanDensity" to get the mean for each Family is really
### taking a mean of means, so all the species means are weighted the same, regardless
### of the number of observations for each species. So, wouldn't using "data" give
### a more accurate mean density for a given family?

# Sort the data frame by mean density
OrderedFamilyMeanDensity <- arrange(FamilyMeanDensity, by_group = Density)

# Find the 8 families with the highest average densities
low <- (length(OrderedFamilyMeanDensity$Family) - 7)
high <- length(OrderedFamilyMeanDensity$Family)
highestFamilyDensities <- OrderedFamilyMeanDensity$Family[low:high]

# Find the 8 families with the lowest average densities
low <- 1
high <- 8
lowestFamilyDensities <- OrderedFamilyMeanDensity$Family[low:high]

# Problem 7: Plotting
# Plotting the lowest density families:
# getting the subset of data
lowDensitySpecies <- SpeciesMeanDensity[which(SpeciesMeanDensity$Family %in% lowestFamilyDensities),]
# Plot:
ggplot(data = lowDensitySpecies, aes(y = Density)) +
  geom_boxplot(aes(fill=Family)) + 
  facet_wrap(~Family) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  ylab("Density (g/cm^3)") + 
  ggtitle("Densities of individual species from the families with the lowest average densities")

# Plotting the highest density families:
# getting the subset of data
highDensitySpecies <- SpeciesMeanDensity[which(SpeciesMeanDensity$Family %in% highestFamilyDensities),]
# Plot:
ggplot(data = highDensitySpecies, aes(y = Density)) +
  geom_boxplot(aes(fill=Family)) + 
  facet_wrap(~Family) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  ylab("Density (g/cm^3)") + 
  ggtitle("Densities of individual species from the families with the highest average densities")

# Problem 8: Comparison graphs
# For lowest densities:
ggplot(data = lowDensitySpecies, aes(x = Family, y = Density)) +
  geom_boxplot(aes(fill=Family)) + 
  coord_flip() +
  ylab("Density (g/cm^3)") + 
  ggtitle("Densities of individual species from the families with the lowest average densities")

# For highest densities:
ggplot(data = highDensitySpecies, aes(x = Family, y = Density)) +
  geom_boxplot(aes(fill=Family)) + 
  coord_flip() +
  ylab("Density (g/cm^3)") + 
  ggtitle("Densities of individual species from the families with the highest average densities")


