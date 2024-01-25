#Data was imported via "import datasets-> from excel
#packages
library(readxl)
library(modeest)
library(tableone)
library(tidyverse)
#descriptive
glimpse(Heart_attack_copy)
summary(Heart_attack_copy)
#refer variables directly
attach(Heart_attack_copy)
mean(Age)
table(Heart_attack_copy$Diabetes)
#Factor variables
Heart_attack_copy$Diabetes<-factor(Heart_attack_copy$Diabetes,levels = c("0","1"),labels = c("No","Yes"))
summary(Heart_attack_copy)
#Table 1
Table1<-CreateTableOne(data=Heart_attack_copy)
summary(Table1)
#table 1 (with selected variables)
listvar<-c("Age","Cholesterol","Heart Rate")
catVars <- c("Heart_attack_copy$Diabetes")
table10 <-CreateTableOne(vars = listvar,data = Heart_attack_copy)
table10<-print(table10)
write.csv(table10,file="population characteristics.csv")
table1
#table1 (stratefied by a variable)
table1 <- CreateTableOne(listvar,Heart_attack_copy,strata=c("Diabetes"))
table1
table1<-print(table1)
write.csv(table1,file="population characteristics.csv")

