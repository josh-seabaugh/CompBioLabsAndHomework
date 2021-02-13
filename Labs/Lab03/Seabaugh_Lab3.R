# Josh Seabaugh
# EBIO 5420
# Lab 3, week 4

# lab step #3: Storing the number of chip bags and
# the number of guests in variables
chip_bags <- 5
guests <- 8

# lab step #5: Each guest, on average, will eat 0.4 bags of chips
eating_rate = 0.4

# lab step #7: calculating the expected amount of leftover chips
chip_bags - ((guests + 1) * eating_rate)

# lab step #8: assigning vectors to the movie rankings of each person
self = c(7, 9, 8, 1, 2, 3, 4, 5, 6)
Penny = c(5, 9, 8, 3, 1, 2, 4, 7, 6)
Lenny = c(6, 5, 4, 9, 8, 7, 3, 2, 1)
Stewie = c(1, 9, 5, 6, 8, 7, 2, 3, 4)

# lab step #9: accessing values for the rankings of Episode IV
PennyIV <- Penny[4]
LennyIV <- Lenny[4]

# lab step #10: combining all vectors into one
all_rankings <- cbind(self, Penny, Lenny, Stewie)

# lab step #11: inspecting structures
str(PennyIV)
str(Penny)
str(all_rankings)

# Penny IV contains just a single number
# Penny contains a row vector of 9 numbers
# all_rankings contains 4 columns and 9 rows of numbers, as well as a row
# of 4 char

# lab step 12: making a dataframe out of the rankings
DF_rankings <- as.data.frame(all_rankings)
DF_rankings <- data.frame(self, Penny, Lenny, Stewie)

# Both all_rankings and DF_rankings have the same dimensions
# I receive TRUE for every value when comparing the two using ==
# The type of all_rankings is "double", whereas the type of DF_rankings is "list"

# lab step #14: making a vector of the episode numbers in strings
episodes <- c("I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX")

# lab step #15: adding row names to all_rankings and DF_rankings
row.names(all_rankings) <- episodes
row.names(DF_rankings) <- episodes

# lab step #16: accessing the third row of all_rankings
all_rankings[3,]

# lab step #17: accessing the fourth column of DF_rankings
DF_rankings[,4]

# lab step #18: accessing my ranking for episode V
DF_rankings[5,1]

# lab step #19: accessing Penny's ranking for episode II
DF_rankings[2,2]

# lab step #20: accessing everyone's rankings for episodes IV-VI
DF_rankings[4:6,]

# lab step #21: accessing everyone's rankings for episodes II, V and VII
DF_rankings[c(2,5,7),]

# lab step #22: accessing Penny and Stewie's rankings for episodes IV and VI
DF_rankings[c(4,6), c(2,4)]

# lab step #23: switching Lenny's rankings for episodes II and V
rank_swap <- DF_rankings[2,3]
DF_rankings[2,3] <- DF_rankings[5,3]
DF_rankings[5,3] <- rank_swap

# lab step #24: accessing Penny's ranking of episode III using row/column names
all_rankings["III", "Penny"]
DF_rankings["III", "Penny"]

# lab step #25: undoing the switch from step #23
rank_swap <- DF_rankings["II", "Lenny"]
DF_rankings["II", "Lenny"] <- DF_rankings["V", "Lenny"]
DF_rankings["V", "Lenny"] <- rank_swap

# lab step #26: re-doing the switch from step #23 using the $ operator
rank_swap <- DF_rankings$Lenny[2]
DF_rankings$Lenny[2] <- DF_rankings$Lenny[5]
DF_rankings$Lenny[5] <- rank_swap