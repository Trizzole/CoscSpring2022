# Chapter 11 of Introduction to Data Science for Business
#
library(readr)
library(tidyverse)
library(dplyr)

webSite <- "http://archive.ics.uci.edu/ml/"
dataLocation <- "machine-learning-databases"
adultData <- "/adult/adult.data"
theUrl <- paste0(webSite, dataLocation, adultData)
incomeDF <- read_csv(theUrl, col_names=FALSE)

col_names <- c("age", "workclass", "fnlwgt", 
               "education", "education_num",
               "marital_status", "occupation",  
               "relationship", "race", "sex",
               "capital_gain", "capital_loss",  
               "hours_per_week", "native_country",
               "income")
colnames(incomeDF) <- col_names

glimpse(incomeDF)

table(incomeDF$income)

#remove a column
library(dplyr)
incomeDF <- select(incomeDF, -fnlwgt)

#Update the columns to factor if it's a string
incomeDF <- mutate_if(incomeDF,is.character, factor)

#define levels for the factors
levels(incomeDF$workclass) <- list(
  public=c("Federal-gov","State-gov","Local-gov"),
  private=c("Private","Self-emp-not-inc",
            "Self-emp-inc"),
  other= c("Never-worked","Without-pay", "?"))
levels(incomeDF$education)<- list(
  noCollege=c("Preschool", "1st-4th",
              "5th-6th","7th-8th", "9th",
              "Assoc-acdm","Assoc-voc","10th",     
              "11th","12th", "HS-grad"), 
  graduate=c("Bachelors","Some-college"),
  master=c("Masters", "Prof-school"), 
  phd=c("Doctorate"))
levels(incomeDF$marital_status)<- list(
  divorce=c("Divorced","Separated"), 
  married=c("Married-AF-spouse",
            "Married-civ-spouse",
            "Married-spouse-absent"),
  notmarried=c("Never-married"), 
  widowed=c("Widowed"))
levels(incomeDF$occupation)<- list(
  clerical=c("Adm-clerical"), 
  tradeskill=c("Craft-repair",
               "Machine-op-inspct","Other-service"),
  physical = c("Transport-moving",
               "Priv-house-serv","Protective-serv", 
               "Handlers-cleaners"),
  highskill=c("Sales","Tech-support","Armed-Forces", 
              "Prof-specialty","Exec-managerial"),
  agricultr=c("Farming-fishing"), 
  unknown = c("?"))
levels(incomeDF$native_country)<- list(  
  Asia=c("Vietnam","Laos","Cambodia","Thailand", 
         "Japan", "South", "China","India","Hong", 
         "Iran", "Philippines", "Taiwan"),
  NorthAmerica=c("Canada","Cuba",
                 "Dominican-Republic","Guatemala","Haiti", 
                 "Honduras","Jamaica","Mexico","Nicaragua",
                 "Puerto-Rico","El-Salvador","United-States",
                 "Outlying-US(Guam-USVI-etc)"),  
  SouthAmerica=c("Ecuador","Peru","Columbia", 
                 "Trinadad&Tobago"),     
  Europe=c("England","France","Germany","Greece",
           "Holand-Netherlands","Italy","Hungary",
           "Ireland", "Poland","Portugal","Scotland", 
           "Yugoslavia"),
  unknown = c("?"))

#install.packages("caret") 
#dependencies???
library(caret)


# makes the sampling predictable
set.seed(111)  

# Randomly sample for training dataset elements  
trainList <- createDataPartition(
  y=incomeDF$income,p=.70, list=FALSE)

trainData <- incomeDF[trainList,]
testData <- incomeDF[-trainList,]

#will take like a minute
svm.model <- train(income~., data = trainData,
                   method = "svmRadial", 
                   trControl = trainControl(method = "none"),
                   preProcess = c("center", "scale")
                   )
svm.model

predictValues <- predict(svm.model, newdata = testData)
confusionMatrix(predictValues, testData$income)

set.seed(111)
subsetList <- createDataPartition(y=incomeDF$income,
                                  p=.05, list = FALSE)


trainData <- incomeDF[subsetList,]
testData <- incomeDF[-subsetList,]

#will take like a minute
svm.model <- train(income~., data = trainData,
                   method = "svmRadial", 
                   trControl = trainControl(method = "none"),
                   preProcess = c("center", "scale")
)
svm.model

predictValues <- predict(svm.model, newdata = testData)
confusionMatrix(predictValues, testData$income)

trctrl <- trainControl(method = "repeatedcv", number = 10)

trainList <- createDataPartition(
  y=incomeDF$income,p=.70, list=FALSE)

trainData <- incomeDF[trainList,]
testData <- incomeDF[-trainList,]

#will take like a minute
svm.model.kfold <- train(income~., data = trainData,
                   method = "svmRadial", 
                   trControl = trctrl,
                   preProcess = c("center", "scale")
)
svm.model.kfold

predictValues <- predict(svm.model.kfold, newdata = testData)
confusionMatrix(predictValues, testData$income)

svm.model.kfold$finalModel@nSV

#262
model.rpart <- train(income~., method = "rpart", data = trainData,
                     trControl = trctrl, tuneLength = 50)
model.rpart

#263
predictValues <- predict(model.rpart, newdata = testData)
confusionMatrix(predictValues, testData$income)

library(rpart)
library(rpart.plot)

rpart.plot(model.rpart$finalModel)



