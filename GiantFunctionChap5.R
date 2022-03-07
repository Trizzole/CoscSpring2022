#############
### The Giant Function is Hard to Understand
#############

## Packages First
#install.packages("tidyverse")
library(tidyverse)
#install.packages("readr")
library(readr)

### Bring in the data first, make sure that
### The URL is working and read_csv

readCensus_first <- function(urlToRead) {
  #read the data from the web
  testFrame <- read_csv(urlToRead)
  return(testFrame)
}

USregionPops_first <- readCensus_first(      
  "http://www2.census.gov/programs-surveys/popest/tables/2010-2011/state/totals/nst-est2011-01.csv")
## A little red text in the console is ok, as long as the next line works
## print the first item in the first row
## to convince ourselves that something is there
USregionPops_first[1,1]

## clearly, a clean dataset would not have all that in the first observation

## Go a little further, make sure Numberize() works

# Numberize() - Gets rid of commas and other junk and 
# converts to numbers
# Assumes that the inputVector is a list of data that 
# can be treated as character strings
Numberize <- function(inputVector)
{
  # Get rid of commas and spaces
  inputVector<-str_replace_all(inputVector, "[, ]","")
  #convert to a number and then return that number
  return(as.numeric(inputVector))
}

## Look at what is inside the original column called ...2
USregionPops_first$...2
Numberize(USregionPops_first$...2)

## It's still not a tidy list of only numbers
## But at least we have SOME numbers in there

mean(Numberize(USregionPops_first$...2))
## cannot perform math because of NA's

##But if we just looked at a few numbers, we could perform math
somenumbers<-Numberize(USregionPops_first$...2)[5:7]
mean(somenumbers)

## So, we want to get it all like that, so that we can do analysis

readCensus_second <- function(urlToRead) {
  #read the data from the web
  testFrame <- read_csv(urlToRead)
  #use pipes to keep updating testFrame
  testFrame <- testFrame %>%
    #only keep the first 5 columns
    select(1:5) %>%
    #convert columns to numbers & rename columns
    mutate(april10census=Numberize(testFrame$...2))%>%
    mutate(april10base=Numberize(testFrame$...3)) %>%
    mutate(july10pop=Numberize(testFrame$...4)) %>%
    mutate(july11pop=Numberize(testFrame$...5))
  return(testFrame)
}

USregionPops_second <- readCensus_second(      
  "http://www2.census.gov/programs-surveys/popest/tables/2010-2011/state/totals/nst-est2011-01.csv")
## A little red text in the console is ok, as long as the next line works
## print the first item in the first row
## to convince ourselves that something is there
USregionPops_second[1,1]
## Look at what is inside the original column called ...2
USregionPops_second$...2[1:10]
## It's still bad, so we are going to chop that off
## Look at the good version
USregionPops_second$april10census[1:10]

USregionPops_first
USregionPops_second


#where I do it on my own

library(tidyverse)
readCensus <- function(urlToRead){
  testFrame <- read_csv(url(urlToRead))
  testFrame <- testFrame %>%
    select(1:5)%>%
    mutate(april10census=Numberize(testFrame$...2))%>%
    mutate(april10base=Numberize(testFrame$...3))%>%
    mutate(july10pop=Numberize(testFrame$...4))%>%
    mutate(july11pop=Numberize(testFrame$...5))%>%
    select(-...2,-...3,-...4,-...5)%>%
    slice(-1:-8)%>%
    #rename(stateName=1)%>%
    slice(c(-52,-54:-n()))%>%
    #mutate(stateName=str_replace_all(stateName,"\.",""))
  #rownames(testFrame) <- NULL
  return(testFrame)
}

Numberize <- function(inputVector){
  inputVector <- str_replace_all(inputVector,"[,]","")
  return(as.numeric(inputVector))
}
USregionPops <- readCensus("http://www2.census.gov/programs-surveys/popest/tables/2010-2011/state/totals/nst-est2011-01.csv")
USregionPops$april10census[1:3]

mean(USregionPops$april10census)
median(USregionPops$april10census)
mode(USregionPops$april10census)
var(USregionPops$april10census)
sd(USregionPops$april10census)

hist(USregionPops_second$april10census)
USregionPops[1:5]
mean(USregionPops$july10pop)

