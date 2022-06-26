# Assignment: ASSIGNMENT 3.2
# Name: Vayuvegula, Soma Shekar
# Date: 2022-06-25

## Load the ggplot2 package
library(ggplot2)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/somashekarvayuvegula/Documents/Workspace/dsc520")

## Load the `data/acs-14-1yr-s0201.csv` to
acs_survey_df <- read.csv("data/acs-14-1yr-s0201.csv")

## Output from the following functions: str(); nrow(); ncol()
str(acs_survey_df)
nrow(acs_survey_df)
ncol(acs_survey_df)

## Histogram of the HSDegree variable
ggplot(acs_survey_df, aes(HSDegree)) + geom_histogram(bins = 100)+ggtitle("HS Degree Distribution")+xlab("HS Degree Percentage")+ylab("Count")

##Include a normal curve to the Histogram that you plotted.

ggplot(data = acs_survey_df) + 
  geom_histogram(mapping = aes(x = HSDegree, y=..density..), fill="steelblue", colour="black", binwidth = 1,bins = 50) +
  ggtitle("HSDegree distribution") + ylab("Relative Frequency") + xlab("HS Degree Percentage") +
  stat_function(fun = dnorm, colour = "red", args = list(mean = mean(acs_survey_df$HSDegree), sd = sd(acs_survey_df$HSDegree)))

##Create a Probability Plot of the HSDegree variable.
ggplot(acs_survey_df, aes(sample=HSDegree)) + stat_qq(col="green") + stat_qq_line(col="yellow", lty=2)


##Now that you have looked at this data visually for normality, you will now quantify normality with numbers using the stat.desc() function. Include a screen capture of the results produced.
library(pastecs)
stat.desc(acs_survey_df$HSDegree, basic = FALSE, norm = TRUE) 

data <- acs_survey_df$HSDegree

z_scores <- (data-mean(data))/sd(data)
z_scores

plot(z_scores, type="o", col="red")
