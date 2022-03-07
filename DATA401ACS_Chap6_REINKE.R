## Assigning a challenge for Chap 6 on Sampling

## Get Data

# Clear the working space
rm(list = ls())

# Set working directory 
setwd("C:/Users/jbuchan1/OneDrive - Samford University/2021/TeachingwithR/DataAmericanDream")

#some of the packages recommended by Holian 
library(stargazer)
#library(sandwich)
#library(car)
library(plyr)
library(data.table)
library(bit64)

# turn off scientific notation except for big numbers
options(scipen = 999)


# Set working directory (I'm showing the code I used to to that)
#setwd("C:/Users/jbuchan1/OneDrive - Samford University/2021/TeachingwithR/DataAmericanDream")
ACS_Buchanan <-fread('ACS_Chap5DATA.csv', header = T, sep = ',')

# create a data frame I name "subset0" which contains all persons surveyed in 2018
sub_2018 = subset(ACS_Buchanan, YEAR==2018)

## use the stargazer package to make a nice table of summary stats for the Homewood area
stargazer(sub_2018[sub_2018$STPUMA==101303], type="text", digits=2, summary.stat=c("n", "mean", "sd", "min", "max" ),title="Summary Statistics for 2018 ACS, Jefferson County (Southeast)")

## the statistic to focus on is individual income
mean(sub_2018[sub_2018$STPUMA==101303]$INCEARN)
## that is a characteristic of the people sampled from the Homewood area

## Your assignment

## 1. Draw 100 people from 101302	Birmingham City (East) PUMA using the sample() command. 
## 2. Consider how likely it is that these 100 people could be drawn from the Homewood area. (following the section of Chap 6 called Comparing Two Samples)
## 3. Create a .R file for submission. Demonstrate whether is is likely that those 100 people are reporting from the Homewood area. 
## Use comments in your .R file so I know why you ran each command. I'll run your R file when I grade it. 

#1 
#create subset for Birmingham City East
sub101302 <- subset(ACS_Buchanan, STPUMA==101302)
sub101302
#subset for income
sub101302Income <- sub101302$INCEARN
#test creating a sample
sample(sub101302Income,size=100,replace=TRUE)
#create a histogram 
hist(replicate(200,mean(sample(sub101302Income,size=100,replace=TRUE)),))
#create subset for income for all of birmingham
allbham <- ACS_Buchanan$INCEARN
#test creating a sample
sample(allbham,size=100,replace=TRUE)
#histogram for all of birmingham income
hist(replicate(200,mean(sample(allbham,size=100,replace=TRUE)),))

#2
#sub101302 mean
subset <- replicate(1000,sample(sub101302Income,size=100,replace=TRUE))
mean(subset)
#all mean
all <- replicate(1000,sample(allbham,size=100,replace=TRUE))
mean(all)
#The mean income of the subset I recieved was 20,111.68
#The mean income of homewood was 24,401.77
#These two means are about 4,000 apart
quantile(subset,probs=c(0.005,0.995))
quantile(subset,probs=c(0.025,0.975))
quantile(all,probs=c(0.005,0.995))
quantile(all,probs=c(0.025,0.975))
sd(subset)
sd(all)
sd(all)/sqrt(100)
#with the two sets having means about one SDE away, I think it is reasonable to conclude that the East Birmingham Area matches up with Homewood, not perfectly, but it's not too different