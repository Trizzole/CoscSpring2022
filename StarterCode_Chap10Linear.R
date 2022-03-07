# Chapter 10 of Introduction to Data Science for Business
#

oilChanges <- c(3,5,2,3,1,4,6,4,3,2,0,10,7,8)
repairs <- c(300, 300, 500, 400, 700, 420, 100, 290,
             475, 620, 600, 0, 200, 50)
miles <- c(20100, 23200, 19200, 22100, 18400, 23400, 
           17900, 19900, 20100, 24100, 18200, 19600, 20800, 
           19700)
oil <- data.frame(oilChanges, repairs, miles)
View(oil)

#plot the data two different ways
plot(oil$oilChanges, oil$repairs)

library(ggplot2)
ggplot(oil, aes(x=miles, y=repairs)) + geom_point()

#build a linear model
model1 <- lm(formula=repairs ~ oilChanges, data=oil)
summary(model1)

### type the rest for this section, better to learn that way!

plot(oil$oilChanges, oil$repairs)
abline(model1)

m <- lm(formula = repairs ~ oilChanges + miles, data=oil)
summary(m)

oil$OilChangeCost <- oil$oilChanges * 350
oil$totalCost <- oil$OilChangeCost + oil$repairs

ggplot(oil, aes(x=oilChanges, y = totalCost)) + geom_point() + geom_smooth(method="lm")

m <- lm(formula = totalCost ~ oilChanges, data=oil)

test = data.frame(oilChanges=0)
predict(m, test, type="response")




### Some code you can use for the Caret package section

#install and library the caret package as needed
#install.packages('caret', dependencies = TRUE)
library(caret)

#create the model, letting caret's train function
#call the lm function
model1 <- train(repairs ~ oilChanges, data = oil,
                trControl=trainControl(method = "none"),
                method = "lm")
summary(model1)


#use the set.seed to enable repeatable results
set.seed(10) 

# Create our weather outcome variable
sunnyDays.percentCloudy <- 
  sample(1:10, 16, replace=TRUE)
cloudyDays.percentCloudy <- 
  sample(90:100, 12, replace=TRUE)
percentCloudyAllDays <- c(sunnyDays.percentCloudy, 
                          cloudyDays.percentCloudy)

### type the rest for this section, better to learn that way!

trainList <- createDataPartition(percentCloudyAllDays, p=0.5, list=FALSE)

data.frame(trainList, cloudPercent=percentCloudyAllDays[trainList])

trainData <- percentCloudyAllDays[trainList]
testData <- percentCloudyAllDays[-trainList]

set.seed(123)

trainList <- createDataPartition(
  y=oil$repairs, p=.66, list=FALSE
)

head(trainList[,1])

trainData <- oil[trainList,]
testData <- oil[-trainList]

lm.model <- train(repairs ~ oilChanges+miles, 
                  data = trainData, 
                  trControl=trainControl(method = "none"),
                  method = "lm")

summary(lm.model)

predictValues <- predict(lm.model, newdata=testData)
cor(predictValues, testData$repairs)^2



trctrl <-   trainControl(method="repeatedcv",  number=10, repeats=3)
lm.model1 <- train(repairs ~ oilChanges + miles, data = trainData,
                   method = "lm", trControl=trctrl)

predictValues <- predict(lm.model1, newdata=testData)
cor(predictValues, testData$repairs)^2


###########################
# case (handing out this code if helpful)
###########################

#load survey 
library(tidyverse)
library(jsonlite) 
## as you know, need to set working directory 
mydata.list <- fromJSON("completeSurvey.json" )
surveyWithNA <- data.frame(mydata.list)

#Remove rows with Likelihood.to.recommend == NA
survey <- surveyWithNA %>% 
  filter(!is.na(Likelihood.to.recommend))

#build a model
trctrl <-   trainControl(method="repeatedcv", 
                         number=10, repeats=3)
lmOut <- train(Likelihood.to.recommend ~ Type.of.Travel + 
                 Airline.Status + Age, 
               data=survey,
               trControl=trctrl,
               method = "lm")

summary(lmOut)

#explore age

survey %>% sample_n(size=300, replace=T) %>%
  ggplot() + aes(x=Age, y=Likelihood.to.recommend) + geom_point() + geom_smooth(method = "lm")

# First, recode Age to represent each decade
survey$roundedAge <- as.factor(round(survey$Age,-1))


# Now make a bar plot by decade group
survey %>%
  group_by(roundedAge) %>%
  summarize(ltr=mean(Likelihood.to.recommend)) %>%
  ggplot() + aes(x=roundedAge, y=ltr) + geom_col()

cor(survey$Likelihood.to.recommend, survey$Age)
cor(survey$Likelihood.to.recommend, survey$Age^2)
