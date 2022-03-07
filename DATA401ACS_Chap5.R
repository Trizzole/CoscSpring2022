## Data Assignment to go with Chapter 5 in Saltz textbook
## Buchanan extracted data from the American Community survey through the IPUMS website
## Minimal changes made except for dropping everything outside of Birmingham, AL

## Note that I am borrowing some ideas and code from Matthew Holian and 
## his new book Data and the American Dream

## load in the data by reading in the CSV you got from the website


#==============================================================================
#   1. Settings, packages, and options
#==============================================================================

# Begin by modifying line 20 so it points to your directory folder, the run the rest of the
# code in this section. If you don't know what a directory folder is STOP and read DAD Appendix I first.

# Clear the working space
rm(list = ls())

# Set working directory 
setwd("C:/Users/thoma/OneDrive - Samford University/Data401")

# You generally need to install packages only once. Delete the # and run the line
# of code below in order to install packages; afterwards add the # back so you don't waste time by accidentally installing packages twice

#install.packages(c("stargazer", "sandwich", "car", "plyr", "data.table", "bit64", "spatstat"))  

# If the packages are installed, load them. 
# Load the packages; we need four for this script: stargazer, sandwich, car and plyr

library(stargazer)
library(sandwich)
library(car)
library(plyr)
library(data.table)
library(bit64)

# turn off scientific notation except for big numbers
options(scipen = 999)


#==============================================================================
#   2. Data section
#==============================================================================


# Set working directory (I'm showing the code I used to to that)
#setwd("C:/Users/jbuchan1/OneDrive - Samford University/2021/TeachingwithR/DataAmericanDream")
ACS_Buchanan <-fread('ACS_Chap5DATA.csv', header = T, sep = ',')

#see which years are in the data (selected by Dr. Buchanan at the time of extraction)
table(ACS_Buchanan$YEAR)
# create a data frame I name "subset0" which contains all persons surveyed in 2016 

subset0 = subset(ACS_Buchanan, YEAR==2018)

#save(subset0, file = "subset0.RData")
#load("subset0.RData")

#  state-PUMA code to uniquely identify each PUMA (public-use microdata area)

table(ACS_Buchanan$STPUMA)

# create CHILD indicator variable

subset0$CHILD=recode(subset0$AGE, "0:18=1; 19:97=0")

# create WHITE and BLACK indicator variable

subset0$WHITE=recode(subset0$RACE, "1=1; 2:9=0")
subset0$BLACK=recode(subset0$RACE, "1=0; 2=1; 3:9=0")

# generate indicator variables equal to one if the respondent has a college degree and zero if not, and one if married and zero if not

subset0$COLLEGE = recode(subset0$EDUCD, "0:100=0; 101:116=1; 999=NA")
subset0$MARRIED = recode(subset0$MARST, "1:2=1; 3:6=0")

# create subset for educational attainment statistic

subset1 = subset(subset0, AGE>24)

# create subset for household-level statistics

subset2 = subset(subset0, RELATE==1)

#A table just for the area containing Homewood
HomewoodTable=subset(subset0, STPUMA==101303, select=c(CBSERIAL, SERIAL, AGE, CITIZEN, RELATED, EDUCD, SEX, UHRSWORK, OCC1990, HHINCOME))

# The following command shows the data 
summary(HomewoodTable)


#A table for east Birmingham City, with our new variables we made in the cleaning steps, adults only
EastBhamTable=subset(subset1, STPUMA==101302, select = c(SEX, WHITE, MARRIED, INCEARN ))
# The following command shows the data 
summary(EastBhamTable)

# Review of the PUMA codes and regions 
#State	PUMA	NAME

#	AL	101200	Shelby County PUMA
#	AL	101301	Birmingham City (West) PUMA
#	AL	101302	Birmingham City (East) PUMA
#	AL	101303	Jefferson County (Southeast)--Hoover (North), Vestavia Hills & Homewood Cities PUMA
#	AL	101304	Jefferson County (Northeast)--Trussville, Center Point & Gardendale Cities PUMA
#	AL	101305	Jefferson County (West)--Bessemer, Hueytown & Pleasant Grove Cities PUMA
