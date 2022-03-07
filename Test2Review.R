#First chapter Challege
#Chapter 6
sample(c("blue","red"),size=8,replace=T)

#Challenge 2
sum(sample(c("blue","red"),size=8,replace=T))

library(stargazer)
#library(sandwich)
#library(car)
library(plyr)
library(data.table)
library(bit64)

library(tidyverse)

dat <- tibble(
  
  x = rnorm(1000, 50, 25)
  
) %>%
  
  mutate(     x = if_else(x < 0, 0, x)   ) %>%
  
  filter(x < 100)

dat <- dat %>%
  
  mutate(     D  = if_else(x > 50, 1, 0),
              
              y1 = 25 + 0 * D + 1.5 * x + rnorm(n(), 0, 20)   )

model1 <- lm(formula = y1 ~ x, data = dat)
summary(model1)

library(caret)

model2 <- train(y1 ~ x, data = dat, trControl = trainControl(method="none"),method="lm")
summary(model2)


trctrl <- trainControl(method="repeatedcv", number = 10, repeats = 3)

model3 <- train(y1 ~ x, data = dat, trControl = trctrl, method = "lm")
summary(model3)


dat$roundedx <- as.factor(round(dat$x,-1))

dat %>%
  ggplot() + aes(x=roundedx,y=y1) + geom_col()

dat %>%
  ggplot() + aes(x=x,y=y1) + geom_point() + ggtitle("Earnings Over Test Scores")

dat %>%
  ggplot() + aes(x=roundedx,y=y1) + geom_point() + ggtitle("Earnings Over Test Scores")

dat %>%
  group_by(D) %>%
  summarize(ltr = mean(x))%>%
  ggplot() + aes(x=D,y=ltr) + geom_col()

sub_D0 = subset(dat, D==0)
sub_D1 = subset(dat, D==1)
mean(sub_D0$x)
mean(sub_D1$x)
