---
  title: "Sandhagen UBI data analysis"
  author: "Maxwell Michelon"
  date: "May 25, 2020"
---
    
## Set up libraries
library(dplyr)
library(tidyverse)
library(ggplot2)

## Read in input from local location
ubi <- read.csv("UBI_Regression_Analysis/CapstoneData.csv")
ubi

ggplot(data=ubi, aes(MarginofError, MedianIncome)) + geom_point()


## Example linear regression test, to nail down fundamentals
##
##
head(cars)

scatter.smooth(x=cars$speed, y=cars$dist, main="Dist ~ Speed")  # scatterplot

# calculate correlation between speed and distance 
cor(cars$speed, cars$dist)

# build linear regression model on full data
linearMod <- lm(dist ~ speed, data=cars)
print(linearMod)

# Measure if it is statistically significant
summary(linearMod)

modelSummary <- summary(linearMod)  # capture model summary as an object

modelCoeffs <- modelSummary$coefficients  # model coefficients

beta.estimate <- modelCoeffs["speed", "Estimate"]  # get beta estimate for speed

std.error <- modelCoeffs["speed", "Std. Error"]  # get std.error for speed

t_value <- beta.estimate/std.error  # calc t statistic

p_value <- 2*pt(-abs(t_value), df=nrow(cars)-ncol(cars))  # calc p Value

f_statistic <- linearMod$fstatistic[1]  # fstatistic

f <- summary(linearMod)$fstatistic  # parameters for model p-value calc

model_p <- pf(f[1], f[2], f[3], lower=FALSE)

# Akaike's information criterion
AIC(linearMod)  # AIC => 419.1569

# Bayesian information criterion
BIC(linearMod)  # BIC => 424.8929