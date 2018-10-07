#Author: Aymone KOuame
#Date: 10/7/2018
# NOTE: Linked RStudio IDE to GitHub using git bash

# 1. LOAD DATA FROM GITHUB

 #1.a Function to load data from "data" directory in GitHub
GetData<- function(filename) {
  
  link <- paste("../data", filename, sep = "/")
  data <- read.csv(link)
}

 #1.b Load data
   ## O_EDVisit= Emergency Department ED Visitis for Drug Oversose
   ## 0_nHosp = Number of hospitalizations for Opioid overdose
   ## 0_PHosp = Number of hospitalizations for Opioid overdose
   ## n_Hosp = Number of hospitalizations for Opioid overdose

O_EDVisit   <- GetData("Emergency_Department__ED__Visits_For_Overdose_Identified_Through_Syndromic_Surveillance_CY_2017_Annual_County_Health.csv")
O_EDVisit2  <- GetData("Emergency_Department__ED__Visits_for_Drug_Overdose_By_Gender_Identified_Through_Syndromic_Surveillance_SFY_Q3_2016_-_Current_Quarterly_County_Health.csv")
O_nHosp     <- GetData("Number_of_Hospitalizations_for_Opioid_Overdose_Statewide_Health_Care_Cost_Containment_Council__PHC4_.csv")
O_pHosp     <- GetData("Percent_of_Hospitalizations_for_Opioid_Overdose_by_Anticipated_Payer_Statewide_Health_Care_Cost_Containment_Council__PHC4_.csv")
O_rHosp     <- GetData("Rate_of_Hospitalizations_for_Opioid_Overdose_per_100_000_Residents_County_Health_Care_Cost_Containment_Council__PHC4_.csv")
O_Info      <- GetData("Overdose_Information_Network_Data_Current_County_State_Police.csv")



#1.c descriptive numbers and stats
dim(O_EDVisit)  # rows, col: 408,15
dim(O_EDVisit2) #3045,16
dim(O_nHosp)    # 4,7
dim(O_pHosp)    #8,8
dim(O_rHosp)    # 68,11
dim(O_Info)     #4625, 27

#dropping columns that added no information
library(dplyr)

##
str(O_EDVisit)
O_EDVisit17<- subset(O_EDVisit,  # data is for whole year 2017
                       select = -c(Time.Measure, Year.Date.Start, Date.Revised, Notes, State.FIPS.Code), drop = TRUE)

##
str(O_EDVisit2)
#levels(O_EDVisit2$Time.Period) 
O_EDVisit161718 <- subset(O_EDVisit2,
                      select = -c(Time.Measure, Quarter.Date.Start, State.FIPS.Code, Notes, State.FIPS.Code), drop = TRUE)

O_EDVisit17  <- filter(O_EDVisit161718, Year == 2017) #whole year of 2017
O_EDVisitQ16 <- filter(O_EDVisit161718, Year == 2016) #for last 2 quarters of 2016
O_EDVisitQ18 <- filter(O_EDVisit161718, Year == 2018) #firstquarter 2018

##
str(O_nHosp)
#levels(O_nHosp$Time.Period.Date.Start) and levels(O_nHosp$Time.Period.Date.End)
# show data is for the whole years of 2016 and 2017

O_nHosp1617 <- subset(O_nHosp,
                      select = -c(ï..State, Time.Period.Date.Start, Time.Period.Date.End, State.FIPS.Code), drop = TRUE)

colnames(O_nHosp1617)[1] <- "Year"  # rename Time.Period to Year
levels(O_nHosp1617$Year)<- c(2016, 2017) # renamed from cy 2016 to 2016, etc.

##
str(O_pHosp)
#levels(O_pHosp$Time.Period.Date.Start) and levels(O_pHosp$Time.Period.Date.End)
# show data is for the whole years of 2016 and 2017

O_pHosp17 <- subset(O_pHosp,
                      select = -c(ï..State, Time.Period.Date.Start, Time.Period.Date.End, State.FIPS.Code), drop = TRUE)

colnames(O_pHosp17)[1] <- "Year"  # rename Time.Period to Year
levels(O_pHosp17$Year)<- c(2017) # renamed from cy 2016 to 2016, etc.

##
str(O_rHosp)
#levels(O_rHosp$Time.Period.Date.Start) and levels(O_rHosp$Time.Period.Date.End)
#reveal data is the accumulation of 2 years data , 2016 and 2017
O_rHosp16_17 <- subset(O_rHosp,
                    select = -c(Time.Period.Date.Start, Time.Period.Date.End, State.FIPS.Code), drop = TRUE)

colnames(O_rHosp16_17)[2] <- "Year"  # rename 'Time.Period' to 'Year'

##
str(O_Info)
levels(O_Info$Incident.Date)  # reveals data is daily data from 01/01/18 to 9/19/18, 262 days

O_InfoD18 <- subset(O_Info, select = -c(Incident.State)) #removed because it's all 'PA'

##
#Merging Data as much as possible?
o_data2017<- merge(O_nHosp1617,O_pHosp17, 
                   by= intersect(names(O_nHosp1617), names(O_pHosp17)))

Overdose_data1617<- merge(o_data2017, O_EDVisit17, 
                   by= intersect(names(o_data2017), names(O_EDVisit17)))



## need to convert data to yealy data and add merge-----------------------------
O_EDVisitQ16
O_EDVisitQ18
O_rHosp16_17
O_InfoD18 
#-------------------------------------------------------------

#For now, let's work with combined data

isTRUE(is.na(Overdose_data1617)) # no missing value with data set
colnames(Overdose_data1617)[6]<- "Age.Group"
dim(Overdose_data1617) #13920 rows, 16 columns

colnames(Overdose_data1617)


# defining response/independent variable y. ??? could be three: rate of hospita; %pf hospita or rate of ED visits - all due to opiod
y <-

  #Also muct convert categorical vars into num
  #Assess correlations/do var selection
  #
  


summary(Overdose_data1617)

#seeing correlation between variables???




