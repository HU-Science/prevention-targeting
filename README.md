# Prevention Targeting
CODE4PA Prevention Targeting

Our writing and coding are stored in the Dropbox folder. The data are stored in the github team site repository.

The following listed how to use R to link to our Github data repository

# Phase 1: Identify datasets (Week 1)

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

# Phase 2: Discover insights (Week 2)

# Phase 3: Refine insights and push the findings to a R Shiny Web App (Week 3)

# Phase 4: Prepare the PPT for the pitch (Week 4)
