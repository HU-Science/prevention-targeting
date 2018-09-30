# Prevention Targeting
CODE4PA Prevention Targeting

Our writing and coding are stored in the Dropbox folder. The data are stored in the github team site repository.

The following listed how to use R to link to our Github data repository

## Problem/Goal Statement
Find the factors to develop a recommondation system based on the composite scores to determine which counties in PA are more at risk for "effects".

## Research Topics

1. Overdose: Aymone

2. Addicted babies: Ziyuan

3. Methadone: Dr. Anderson and Polly

4. Doc: Patrick

5. Drug monigoring: Sagar

## Phase 1: Identify datasets (Week 1)

Team Demacian identified 22 datasets to use (more datasets maybe added while we are doing data analysis):

```{r}
1	Babies_born_on_Medical_Assistance__MA__with_Neonatal_Abstinence_Syndrome__NAS__CY_2015-_2016_County_Human_Services

2	Drug_and_Alcohol_Treatment_Facilities_May_2018_County_Drug_and_Alcohol_Programs

3 Emergency_Department__ED__Visits_for_Drug_Overdose_By_Gender_Identified_Through_Syndromic_Surveillance_SFY_Q3_2016_-_Current_Quarterly_County_Health

4	Emergency_Department__ED__Visits_For_Overdose_Identified_Through_Syndromic_Surveillance_CY_2017_Annual_County_Health

5	Individuals_under_Medical_Assistance__Newly_Eligible__Diagnosed_with_Opioid_Use_Disorder_CY_2015-2017_County_Human_Services

6	Individuals_with_Medical_Assistance__MA__receiving_Medical_Assisted_Treatment__MAT__CY_2015-2016_County_Human_Services

7	Inmate_Admissions_with_Substance_Use_Year_2018_Quarterly_County_Corrections

8	Newly_Identified_Confirmed_Chronic_Hepatitis_C_Age_15-34_Year_2007-2016_Health

9	Number_of_Hospitalizations_for_Opioid_Overdose_Statewide_Health_Care_Cost_Containment_Council__PHC4_

10	Opioid_Dispensation_Data_County_Quarter_3_2016_-_Current_Health

11	Opioid_Seizures_and_Arrests_Year_2013_-_June_2018_County_State_Police

12	Overdose_Information_Network_Data_Current_County_State_Police

13	Percent_of_Hospitalizations_for_Opioid_Overdose_by_Anticipated_Payer_Statewide_Health_Care_Cost_Containment_Council__PHC4_

14	Prescription_Drug_Take-Back_Box_Locations_County_Drug_and_Alcohol_Programs

15	Rate_of_Hospitalizations_for_Opioid_Overdose_per_100_000_Residents_County_Health_Care_Cost_Containment_Council__PHC4_

16	Single_County_Authority__SCA__Locations_Current_Drug_and_Alcohol_Programs

17	Successful_Naloxone_Reversals_by_Law_Enforcement_Years_2014_-_June_2018_County_Drug_and_Alcohol_Program (1)

18	Uninsured_Population_Census_Data_CY_2009-2014_Human_Services
```

```{r}
# load library
library(RCurl);library(readr)

# assign raw file link to variables
newlyidentified.link <- "https://raw.githubusercontent.com/TeamDemacian/prevention-targeting/master/data/Newly_Identified_Confirmed_Chronic_Hepatitis_C_Age_15-34_Year_2007-2016_Health.csv"
babies.link <- "https://raw.githubusercontent.com/TeamDemacian/prevention-targeting/master/data/Babies_born_on_Medical_Assistance__MA__with_Neonatal_Abstinence_Syndrome__NAS__CY_2015-_2016_County_Human_Services.csv"

# get url data
babies.csv <- getURL(babies.link)
newlyidentified.csv <- getURL(newlyidentified.link)

# read csv data
babies <- read_csv(babies.csv)
newlyidentified <- read_csv(newlyidentified.csv)

# display head data
head(babies)

# display head data
head(newlyidentified)

```

## Phase 2: Discover insights (Week 2)

## Phase 3: Refine insights, predictive modeling, and push the findings to a R Shiny Web App (Week 3)

## Phase 4: Prepare the PPT for the pitch (Week 4)

Each topic may occupy 1 minute in the pitch
