# Assignment: ASSIGNMENT 5.2
# Name: Vayuvegula, Soma Shekar
# Date: 2022-07-24

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/somashekarvayuvegula/Documents/Workspace/dsc520")

## Load the `completed/week7/student-survey.csv` to
survey_df <- read.csv("completed/week7/student-survey.csv")
head(survey_df)

## Use R to calculate the covariance of the Survey variables and provide an 
## explanation of why you would use this calculation and what the results indicate.
## TimeReading vs. TimeTV
cov(survey_df$TimeReading,survey_df$TimeTV)
# The result is in negative and thus TimeReading and TimeTV are negatively related.
### TimeReading vs. Happiness
cov(survey_df$TimeReading,survey_df$Happiness)
# The result is in negative and thus TimeReading and Happiness are negatively related.
### TimeReading vs. Gender
cov(survey_df$TimeReading,survey_df$Gender)
# The result is in negative and thus TimeReading and Gender are negatively related.
## TimeTV vs. Happiness
cov(survey_df$TimeTV,survey_df$Happiness)
# The result is in positive and thus TimeTV and Happiness are positively related.
### TimeTV vs. Gender
cov(survey_df$TimeTV,survey_df$Gender)
# The result is in positive and thus TimeTV and Gender are positively related.
### Happiness vs. Gender
cov(survey_df$Happiness,survey_df$Gender)
# The result is in positive and thus Happiness and Gender are positively related.

##Examine the Survey data variables. What measurement is being used for the variables? 
##Explain what effect changing the measurement being used for the variables would have on the 
##covariance calculation. Would this be a problem? Explain and provide a better alternative if needed.

#Answer:
#Time-Reading - In hours
#Time-TV - In minutes
#Happiness - Numeric 0-100 (O being lowest and 100 being highest)
#Gender - Binary 0 and 1
#Except gender all other variables are in numeric
#I would change the gender from numeric to String as in current world people do not represent 
#themselves using binary gender.They represent themselves using various forms which include but 
#not limited to gender queer, agender etc.,
#I would suggest avoid computing Covariance between Gender and the others since its not really 
#relevant to the research question.


#Choose the type of correlation test to perform, explain why you chose this test, and make a 
#prediction if the test yields a positive or negative correlation?

cor(survey_df$TimeReading,survey_df$TimeTV)

#Answer:
#I have chosen to calculate correlation between Time Reading v Time TV as both are time related.
#Correlation is negative and closer to -1 which mean both are in inverse relationship. This suggest
#time spent on reading is inverse to time spent on TV. If a person spends more time in watching TV, 
#will spend less time reading or vice-versa.


#Perform a correlation analysis of:
#All variables
cor(survey_df, use = "complete.obs", method = "pearson")
#A single correlation between two a pair of the variables
cor(survey_df$TimeTV,survey_df$Happiness)
#Repeat your correlation test in step 2 but set the confidence interval at 99%
cor.test(survey_df$TimeReading, survey_df$Happiness, conf.level = .99)
#Describe what the calculations in the correlation matrix suggest about the relationship 
#between the variables. Be specific with your explanation.

#Answer:
#Time Reading and Time TV has a negative correlation
#Time reading and Happiness has negative correlation
#Time reading and Gender has negative correlation
#All above three comparison shows if one goes up other variable will go down, which means they 
#have inverse relationship
#Time TV and Happiness has positive correlation
#Time TV and Gender has positive correlation
#Happiness and Gender has positive correlation
#All above three comparison shows both variables have closer relationship.

#Calculate the correlation coefficient and the coefficient of determination, describe what you 
#conclude about the results.
survey_df_new <- survey_df[, c("TimeReading", "TimeTV", "Happiness")]
cor(survey_df_new)

# Time TV and Happiness has strong correlation
# Time reading and Time TV has inverse correlation
# Time reading and Happines has moderate correlation

#Based on your analysis can you say that watching more TV caused students to read less? Explain.
#
#Answer:
# Based on my analysis, Time reading and Time TV has inverse correlation, which means if watching 
# TV goes up, reading time goes down. This proves that watching more tv caused students to read less.

#Pick three variables and perform a partial correlation, documenting which variable you are "controlling". 
#Explain how this changes your interpretation and explanation of the results.
install.packages("ggm")
library(ggm)
partial_correlation <- pcor(c("TimeReading", "TimeTV", "Happiness"), var(survey_df_new))
partial_correlation^2

#In this dataset, Happiness is being controlled because Time TV accounts Time Reading and 
#thus Happiness is controlled.
  



