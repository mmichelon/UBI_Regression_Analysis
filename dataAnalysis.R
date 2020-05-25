---
  title: "Sandhagen UBI data analysis"
  author: "Maxwell Michelon"
  date: "May 25, 2020"
---
    
## Set up libraries
library(dplyr)
library(ggplot2)

## Read in input from local location
ubi <- read.csv("UBI_Regression_Analysis/CapstoneData.csv")

ubi

ggplot(data=ubi, aes(MarginofError, MedianIncome)) + geom_point()

