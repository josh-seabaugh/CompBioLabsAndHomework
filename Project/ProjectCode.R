# Josh Seabaugh
# EBIO 5420
# Final Project Code

# Clear workspace
rm(list = ls())

# Load libraries
library("dplyr")
library("ggplot2")
library("lubridate")

# Set the working directory
setwd("~/Documents/EBIO_5420_CompBio/CompBioLabsAndHomework/Project")

# Load the original data from Dryad
OriginalData <- read.csv("grid_SEMdata_FINAL.csv", stringsAsFactors = F)

# Add a column for Predator Occupancy that combines the probability of lion
# occupancy with the probability of competitor occupancy
OriginalData$predator_occ <- OriginalData$lion_occ * OriginalData$competitor_occ

# PLOTTING DATA ACROSS SITES AND MANAGEMENT TYPES
# Collapse all the data by site and average the column values for each site
DatabySite <- summarise( group_by( OriginalData, Grid, site), 
                         PredatorOccupancy = mean(predator_occ), n = n(),
                         .groups = 'drop')

# Create another column that tells what type of site each grid is located in -
# either a national park or a hunting concession
DatabySite[, "Type"] <- NA
NationalParks <- which(DatabySite$site == "ARL" | DatabySite$site == "WBK" | DatabySite$site == "WNI")
HuntingConcessions <- which(DatabySite$site != "ARL" & DatabySite$site != "WBK" & DatabySite$site != "WNI")
DatabySite$Type[NationalParks] <- "NP"
DatabySite$Type[HuntingConcessions] <- "HC"

# Plot predator occupancy estimates across the 14 sites
SiteOccupancyPlot <- ggplot(data = DatabySite, aes(y = PredatorOccupancy)) +
  geom_boxplot(aes(fill=Type)) + 
  facet_wrap(~site) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  ylab("Predator Occupancy") + 
  ggtitle("Predator occupancy estimates across sites")

# Plot predator occupancy estimates by management type
MGMTOccupancyPlot <- ggplot(data = DatabySite, aes(y = PredatorOccupancy)) +
  geom_boxplot(aes(fill=Type)) + 
  facet_wrap(~Type) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  ylab("Predator Occupancy") + 
  ggtitle("Predator occupancy estimates compared for national parks and hunting concessions")

# EXPLORING THE DATA
# Looking at the distribution of predator occupancy across sites
ggplot(data = DatabySite, aes(x = PredatorOccupancy)) + geom_histogram(bins = 50) 

# Looking at average precipitation and predator occupancy distribution
ggplot(data = OriginalData, aes(x = avgprecip, y = predator_occ)) + geom_point() +
  geom_smooth(method='lm')

# Looking at percentage of savanna coverage and predator occupancy distribution
ggplot(data = OriginalData, aes(x = pctsavanna, y = predator_occ)) + geom_point() +
  geom_smooth(method='lm')

# Looking at amount of river area and predator occupancy distribution
ggplot(data = OriginalData, aes(x = riverkm_perkm2, y = predator_occ)) + geom_point() +
  geom_smooth(method='lm')

# Looking at amount of road area and predator occupancy distribution
ggplot(data = OriginalData, aes(x = roadkm_perkm2, y = predator_occ)) + geom_point() +
  geom_smooth(method='lm')

# Looking at prey availabity (log transform of prey per 100 trap nights) and predator occupancy distribution
ggplot(data = OriginalData, aes(x = logprey, y = predator_occ)) + geom_point() +
  geom_smooth(method='lm')

# Looking at human occupancy and predator occupancy distribution
ggplot(data = OriginalData, aes(x = human_occ, y = predator_occ)) + geom_point() +
  geom_smooth(method='lm')

# Looking at livestock occupancy and predator occupancy distribution
ggplot(data = OriginalData, aes(x = livest_occ, y = predator_occ)) + geom_point() +
  geom_smooth(method='lm')


# REGRESSION ANALYSES
#AVERAGE PRECIPITATION
# Linear regression for the effect of average precipitation on predator occupancy
fit <- glm(predator_occ ~ avgprecip, data = OriginalData, family = "gaussian")
summary(fit)

# Linear regression for the effect of average precipitation on prey availabilty
fit <- glm(logprey ~ avgprecip, data = OriginalData, family = "gaussian")
summary(fit)

#SAVANNA COVERAGE
# Linear regression for the effect of savanna coverage on predator occupancy
fit <- glm(predator_occ ~ pctsavanna, data = OriginalData, family = "gaussian")
summary(fit)

# Linear regression for the effect of savanna coverage on prey availability
fit <- glm(logprey ~ pctsavanna, data = OriginalData, family = "gaussian")
summary(fit)

#RIVER AREA
# Linear regression for the effect of river area on predator occupancy
fit <- glm(predator_occ ~ riverkm_perkm2, data = OriginalData, family = "gaussian")
summary(fit)

# Linear regression for the effect of river area on prey availability
fit <- glm(logprey ~ riverkm_perkm2, data = OriginalData, family = "gaussian")
summary(fit)

#ROAD AREA
# Linear regression for the effect of road area on predator occupancy
fit <- glm(predator_occ ~ roadkm_perkm2, data = OriginalData, family = "gaussian")
summary(fit)

# Linear regression for the effect of road area on prey availability
fit <- glm(logprey ~ roadkm_perkm2, data = OriginalData, family = "gaussian")
summary(fit)

#PREY AVAILABILITY
# Linear regression for the effect of predator availability on predator occupancy
fit <- glm(predator_occ ~ logprey, data = OriginalData, family = "gaussian")
summary(fit)

#HUMAN OCCUPANCY
# Linear regression for the effect of human occupancy on predator occupancy
fit <- glm(predator_occ ~ human_occ, data = OriginalData, family = "gaussian")
summary(fit)

#LIVESTOCK OCCUPANCY
# Linear regression for the effect of livestock occupancy on predator occupancy
fit <- glm(predator_occ ~ livest_occ, data = OriginalData, family = "gaussian")
summary(fit)

#MANAGEMENT TYPE
# Linear regression for the effect of livestock occupancy on predator occupancy
fit <- glm(predator_occ ~ mgmt, data = OriginalData, family = "gaussian")
summary(fit)


#Predicting predator occupancy based on management type and prey availability
# Linear regression for the combined effect of prey availability and management type on predator occupancy
fit <- glm(predator_occ ~ mgmt + logprey, data = OriginalData, family = "gaussian")
summary(fit)

# make a new HC (Hunting concession) data frame to use for the predict model
logprey <- seq(0, max(OriginalData$logprey), 0.5)
mgmt <- rep("HC", length(logprey))
HCData <- data.frame(mgmt, logprey)

# use the predictor model
Prediction <- predict(fit, newdata = HCData, type = "response", se = TRUE)
HCData$PredictedProbability <- Prediction$fit
HCData$SE <- Prediction$se.fit
HCData$LowLim <- HCData$PredictedProbability - HCData$SE
HCData$UpLim <- HCData$PredictedProbability + HCData$SE

# make a new NP (National Park) data frame to use for the predict model
logprey <- seq(0, max(OriginalData$logprey), 0.5)
mgmt <- rep("NP", length(logprey))
NPData <- data.frame(mgmt, logprey)

# use the predictor model
Prediction <- predict(fit, newdata = NPData, type = "response", se = TRUE)
NPData$PredictedProbability <- Prediction$fit
NPData$SE <- Prediction$se.fit
NPData$LowLim <- NPData$PredictedProbability - NPData$SE
NPData$UpLim <- NPData$PredictedProbability + NPData$SE

#Plot the data
TypePreyProbPlot <- ggplot(HCData, aes(x = logprey, y = PredictedProbability)) + 
  geom_line(aes(color = mgmt), size = 1) +
  geom_ribbon(aes(ymin = LowLim, ymax = UpLim, fill = mgmt), alpha = 0.2) +
  geom_line(aes(y = NPData$PredictedProbability, color = NPData$mgmt), size = 1) +
  geom_ribbon(aes(ymin = NPData$LowLim, ymax = NPData$UpLim, fill = NPData$mgmt), alpha = 0.2) +
  ylab("Predicted probability") +
  xlab("log(prey per 100 trap nights)") +
  ggtitle(expression(paste('Likelihood of Large Predator Occupancy'))) +
  scale_x_continuous(breaks=seq(0,6,by=0.5)) + scale_y_continuous(breaks=seq(0,0.95,by=0.1)) +
  theme(plot.title = element_text(hjust = 0.5))

TypePreyProbPlot


