## Exercise 4 ##

z <- c(1:200)
mean (z)
sd (z)
logvec <- z > 1
logvec
df <- data.frame (z, logvec)
colnames (df) <- c("z", "zlog")
df$zsquared <- df$z^2
subset(df, (zsquared > 10 | zsquared < 100))

## Exercise 5 ##

install.packages("ggplot2")
install.packages("dplyr")
install.packages("purrr")
install.packages("lme4")
install.packages("emmeans")

library("ggplot2")
library ("dplyr")
library ("purrr")
library ("lme4")
library ("emmeans")

installed.packages()

## Exercise 6 ##

tips <- read.csv ("TipsR.csv", na.strings = ".")       
tips
dim(tips)
View (tips)
