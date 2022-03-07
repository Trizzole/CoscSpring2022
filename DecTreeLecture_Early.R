## Assigning a challenge for Chap 6 on Sampling

## Get Data

# Clear the working space
rm(list = ls())

# Set working directory 
#setwd("C:/Users/jbuchan1/OneDrive - Samford University/2021/TeachingwithR/DataAmericanDream")

#some of the packages recommended by Holian 
library(stargazer)
library(sandwich)
library(car)
library(plyr)
library(data.table)
library(bit64)
library(tidyverse)
library(ggplot2)
library(caret)
library(rpart.plot)

# turn off scientific notation except for big numbers
options(scipen = 999)


# Set working directory (I'm showing the code I used to to that)
#setwd("C:/Users/jbuchan1/OneDrive - Samford University/2021/TeachingwithR/DataAmericanDream")
ACS_Buchanan <-fread('ACS_Chap5DATA.csv', header = T, sep = ',')

# create a data frame I name "subset0" which contains all persons surveyed in 2018
subset0 = subset(ACS_Buchanan, YEAR==2018)

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



## use the stargazer package to make a nice table of summary stats for the Homewood area
stargazer(subset0[subset0$STPUMA==101303], type="text", digits=2, summary.stat=c("n", "mean", "sd", "min", "max" ),title="Summary Statistics for 2018 ACS, Jefferson County (Southeast)")



## categorical target variable is MARRIED or NOT

## we are approaching the idea of a Decision Tree, but we'll start slow

## what is the profile of married people? I'll use subset1 to exclude children 
stargazer(subset1[subset1$MARRIED==1], type="text", digits=2, summary.stat=c("n", "mean", "sd", "min", "max" ),title="Summary Statistics for 2018 ACS, Jefferson County (Southeast)")
## something to notice is that R is treating STPUMA as a numeric variable
## we know that STPUMA is actually a categorical variable
## it's actually irritating to have so much information, let's select just the variables that have a theoretical connection to marriage

stargazer(subset(subset1, MARRIED==1, select = c(COLLEGE, INCEARN, WHITE, UHRSWORK, OCC1990, EDUC, CITIZEN, AGE,SEX, NCHILD, STPUMA)), type="text", digits=2, summary.stat=c("n", "mean", "sd", "min", "max" ), title="Summary Statistics for 2018 ACS, Jefferson County (MARRIED)") 
# now we'll compare that to the unmarried group
stargazer(subset(subset1, MARRIED==0, select = c(COLLEGE, INCEARN, WHITE, UHRSWORK, OCC1990, EDUC, CITIZEN, AGE,SEX, NCHILD, STPUMA)), type="text", digits=2, summary.stat=c("n", "mean", "sd", "min", "max" ), title="Summary Statistics for 2018 ACS, Jefferson County (NOT MARRIED)") 

# seeing just this, do you start to develop a model for predicting whether a person is married or not? 
# be careful because there is really nothing useful in the way OCC1990 is displayed in this table

# as a conceptual exercise, create a decision tree in a Word doc
# I'll explain more in the assignment 


subset3 <- data.frame(subset2$MARRIED, subset2$AGE, subset2$UHRSWORK)

ggplot(subset3, aes(x=subset2$MARRIED, y=subset2$UHRSWORK)) + geom_point()

ggplot(subset3) + geom_histogram(binwidth = 1,aes(x=subset2$MARRIED))

subset3$repair_cat <- "low age"
subset3$repair_cat[subset3$subset2.AGE > 40] <- "high age"

subset3 <- mutate_if(subset3,is.character, factor)

model.rpart <- train( repair_cat ~ subset2$MARRIED  , method = "rpart", data = subset3)
model.rpart


