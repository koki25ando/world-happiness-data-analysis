setwd("/Users/KokiAndo/Desktop/R/R report/World Happiness")
library(data.table)
library(tidyverse)
#(https://www.kaggle.com/unsdsn/world-happiness)
wh15 <- fread("2015.csv", data.table = FALSE)
wh16 <- fread("2016.csv", data.table = FALSE)
wh17 <- fread("2017.csv", data.table = FALSE)
wh15$year <- 2015
wh16$year <- 2016

#2017 data
wh17$year <- 2017
names(wh17)[2] <- "Happiness Rank"
names(wh17)[3] <- "Happiness Score"
names(wh17)[6] <- "Economy (GDP per Capita)"
names(wh17)[8] <- "Health (Life Expectancy)"
names(wh17)[11] <- "Trust (Government Corruption)"
names(wh17)[12] <- "Dystopia Residual"

wh15_17 <- bind_rows(wh15,wh16,wh17)
names(wh15_17)[5] <- "SD_error"
wh15_17 <- wh15_17 %>% select(Country:year,-Region, -SD_error)


