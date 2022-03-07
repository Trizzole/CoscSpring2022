library(tidyverse)
library(ggplot2)

#Final Exam PRACTICE PROBLEM Simulated Data

dat <- tibble(
  
  age = rnorm(1000, 60, 20)
  
) 

dat <- dat %>% 
  
  mutate(   War  = if_else(age > 70, 1, 0),
            
            Quantity = 20 + 0 * War + 1.5 * age + rnorm(n(), 0, 20)   ) %>%
  
  mutate(
    
    age = if_else(age < 10, 10, age)) %>%
  
  mutate(
    
    Quantity = if_else(Quantity < 0, 0, Quantity))%>%
  
  filter(Quantity > 0 & age < 100)
#questions 1 thru 3
mean(dat$Quantity)
mean(dat$Quantity[dat$age > 25])
mean(dat$Quantity[dat$War == 1])
#question 5
#scatterplot
splot <- ggplot(dat)
splot <- splot + geom_point(aes(x = age, y = Quantity))
splot
#question 6 - Decision Tree
library(caret)
dat$War <- as.factor(dat$War)
trctrl <- trainControl(method = "repeatedcv", number = 10)
model.rpart <- train(War ~ ., method = "rpart", data = dat, 
                     trControl = trctrl, tuneLength = 20)
model.rpart
varImp(model.rpart)

#linear model
linear_model <- lm(formula = Quantity ~ War + age, data = dat)
linear_model
summary(linear_model)
