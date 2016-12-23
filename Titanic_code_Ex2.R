
library(data.table)
library(dplyr)
library(tidyr)
library(readr)

#0: load csv data into R data frame

titanic_original <- read.csv(file="titanic_original.csv", head=TRUE, sep=",")
titanic_original

#1 Port of embarkation: Replace blank cells in the "embarked" column with S

titanic_original$embarked <- sub("^$", "S", titanic_original$embarked) 
titanic_original

#2 Age - Calculate the mean of the Age column and use that value to populate the missing values
#  Think about other ways you could have populated the missing values in the age column. 
#  Why would you pick any of those over the mean (or not)?

titanic_original$age[which(is.na(titanic_original$age))] <- mean(age, na.rm = TRUE)
titanic_original

#3 Lifeboat
# Distribution of passengers in different lifeboats. 
# Many there are a lot of missing values in the boat column. 
# Fill these empty slots with a dummy value e.g. the string 'None' or 'NA'

str(titanic_original)

titanic_original$boat <- sub("^$", "None", titanic_original$boat)
titanic_original

#4 Cabin
# You notice that many passengers don’t have a cabin number associated with them.
# Does it make sense to fill missing cabin numbers with a value? Answer: No.
# What does a missing value here mean? Answer: Missing value perhaps means: People didn’t have a specific assigned cabin or the data is simply missing.
# You have a hunch that the fact that the cabin number is missing might be a useful indicator of survival.
# Create a new column has_cabin_number which has 1 if there is a cabin number, and 0 otherwise.

str(titanic_original)

titanic_original$cabin <-lapply(titanic_original$cabin, as.character)
titanic_original$has_cabin_number <- ifelse(titanic_original$cabin == "NA", 0, 1)
titanic_clean <-titanic_original
titanic_clean$has_cabin_number[which(is.na(titanic_clean$has_cabin_number))] <- 0
str(titanic_clean)
