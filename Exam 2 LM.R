library(tidyverse)
dat <- tibble(x = rnorm(1000,20,15)) %>%
  mutate(x=if_else(x<0,0,x)) %>%
  filter(x<100)
dat <- dat %>%
  mutate(D = if_else(x>50,1,0), y1 = 25 + 0 * D + 1.5 * x + rnorm(n(),0,20))


model1 <- lm(formula = y1 ~ x, data = dat)
summary(model1)

myFamilyAges <- c(43, 42, 12, 8, 5)

myFamilyAges [myFamilyAges > 21]


csvfunc <- function(inputDF){
  csv <- read_csv(inputDF)
  outputDF <- complete.cases(csv)
}

a <- csvfunc('smallSurvey.csv')
summary(a)
