# Assignment: ASSIGNMENT 8
# Name: Vayuvegula, Soma Shekar
# Date: 2022-07-29

survey<-read.csv("/Users/somashekarvayuvegula/Documents/Workspace/dsc520/data/acs-14-1yr-s0201.csv") 
head(survey)

library(readxl)

housing<-read_excel("/Users/somashekarvayuvegula/Documents/Workspace/dsc520/data/week-6-housing.xlsx") 
head(housing)

# Use the apply function on a variable in your dataset

apply(survey,2,length) 
apply(housing,2,length)

# Use the aggregate function on a variable in your dataset

aggregate(survey$Geography,list(unique.values=survey$Geography),length)

# Use the plyr function on a variable in your dataset - more specifically, # I want to see you split some data, perform a modification to the data, and then bring it back together

d <- data.frame(year = rep(2000:2002, each = 3),count = round(runif(9, 0, 20))) 
print(d)

library(plyr) 
ddply(d, "year", function(x) { 
  mean.count <- mean(x$count) 
  sd.count <- sd(x$count) 
  cv <- sd.count/mean.count 
  data.frame(cv.count = cv) 
  }) 

ddply(d, "year", summarise, mean.count = mean(count)) 
ddply(d, "year", transform, total.count = sum(count)) 
ddply(d, "year", mutate, mu = mean(count), sigma = sd(count),cv = sigma/mu)

housing.dat <- subset(housing, 'sale year' > 2000) 
x <- ddply(housing.dat, c("'sale year'", "ctyname"), summarize, homeruns = sum(housing.dat$`Sale Price`)) 
head(x)

# Check distributions of the data 
install.packages("fitdistrplus") 
library(fitdistrplus) 
normal_dist <- fitdist(housing$`Sale Price`, "norm") 
plot(normal_dist)

# Identify if there are any outliers 
summary(housing$`Sale Price`) 
hist(housing$`Sale Price`,xlab = "Price",main = "Histogram of Price",breaks = sqrt(nrow(housing.dat)))

# Create at least 2 new variables 
country<-rep("USA",12865) 
serial_no<-c(1:12865)

new_df<-cbind(serial_no,housing,country) 
head(new_df)

install.packages("olsrr") 
library(olsrr) 
new_model<-lm(new_df$`Sale Price`~new_df$bedrooms,data=new_df)
new_model1<-lm(new_df$`Sale Price`~new_df$sq_ft_lot,data=new_df) 
model_final <- lm(new_df$`Sale Price`~ building_grade+square_feet_total_living+bedrooms +sq_ft_lot+ new_df$bath_full_count,data=new_df)

summary(new_model1)

library("car")
## Loading required package: carData
## 
## Attaching package: 'car'
## The following object is masked from 'package:boot':
## 
##     logit
dwt(salepricebymultiplevar_lm)

summary(model_final) 