# Assignment: ASSIGNMENT 5.2
# Name: Vayuvegula, Soma Shekar
# Date: 2022-07-09

#Library to read dplyr
library(dplyr)

#Read data from CSV file
survey<-read.csv("/Users/somashekarvayuvegula/Documents/Workspace/dsc520/completed/week5/acs-14-1yr-s0201.csv")

#select
survey %>% select(Id, Id2, Geography, PopGroupID, POPGROUP.display.label, RacesReported, HSDegree, BachDegree)
survey

#Filter
survey %>% filter(HSDegree > 80)

#mutate
survey %>% mutate(Diff_HSD_BachD=HSDegree - BachDegree)

#summarize
survey %>% summarize(mean_HSDegree = mean(HSDegree))

#GroupBy
survey %>% group_by(Geography, HSDegree)

#Arrange
survey %>%  summarize(mean_HSDegree = mean(HSDegree),min_weight = min(HSDegree)) %>% arrange(desc(mean_HSDegree))

library(purrr)

#Using the purrr package – perform 2 functions on your dataset.  
#You could use zip_n, keep, discard, compact, etc.

survey %>% map(sample, 5) %>%  keep(~mean(survey$HSDegree) > 80)

survey %>% map(sample, 5) %>%  discard(~mean(survey$BachDegree) > 80)

#cbind
cbind_data<-cbind(Geography=survey$Geography,HSDegree=survey$HSDegree,BachDegree=survey$BachDegree)
cbind_data

#rbind
rbind_data<-rbind(survey[1,],survey[2,],survey[3,],survey[4,],survey[5,])
rbind_data

#Split a string, then concatenate the results back together
library(stringr)

#Split
splitstring <- strsplit(as.character(survey$Geography), ",", fixed = FALSE)
splitstring[[1]]
splitstring[[2]]
splitstring[[3]]
splitstring[[4]]
splitstring[[5]]
splitstring

#Bind
bindstring<-paste(splitstring)
bindstring[[1]]
bindstring[[2]]
bindstring[[3]]
bindstring[[4]]
bindstring[[5]]
bindstring