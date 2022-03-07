library(tidyverse)

#Final Exam Simulated Data

dat <- tibble(
  
  age = rnorm(1000, 50, 20)
  
) 

dat <- dat %>% 
  
  mutate(   Ad  = if_else(age > 65, 1, 0),
            
            Quantity = 120 + 0 * Ad - 1.5 * age + rnorm(n(), 0, 20)   ) %>%
  
  mutate(
    
    age = if_else(age < 10, 10, age)) %>%
  
  mutate(
    
    Quantity = if_else(Quantity < 0, 0, Quantity))%>%
  
  filter(Quantity > 0 & age < 100)

mean(dat$age)
mean(dat$Quantity[dat$age > 25])
mean(dat$Quantity[dat$Ad == 1])
splot <- ggplot(dat)
splot <- splot + geom_point(aes(x = age, y = Quantity))
splot
splot <- splot + geom_point(aes(x=Ad, y = Quantity))
splot
library(caret)
dat$Ad <- as.factor(dat$Ad)
trctrl <- trainControl(method = "repeatedcv", number = 10)
model.rpart <- train(Ad ~ ., method = "rpart", data = dat, 
                     trControl = trctrl, tuneLength = 20)
model.rpart
varImp(model.rpart)

linear_model <- lm(formula = Quantity ~ Ad + age, data = dat)
linear_model
summary(linear_model)
