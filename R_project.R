rm(list = ls())
library(tidyverse)
library(lubridate)
library(forcats)
library(dplyr)
library(stringr)

crimes <- read.csv("class_data/crimedata.csv")

crimes <- crimes[,c("DR_NO","Date.Rptd","DATE.OCC","TIME.OCC","AREA.NAME",
                    "Crm.Cd.Desc","Vict.Age","Vict.Sex","Vict.Descent","Premis.Desc",
                    "Weapon.Desc","Status.Desc")]
crimes <- crimes %>% 
  rename("Crime_ID" = "DR_NO",
         "Date_Reported" = "Date.Rptd",
         "Date_Occured" = "DATE.OCC",
         "Time_Occured" = "TIME.OCC",
         "Area" = "AREA.NAME",
         "Type" = "Crm.Cd.Desc",
         "Victim_Age" = "Vict.Age",
         "Victim_Sex" = "Vict.Sex",
         "Victim_Race" = "Vict.Descent",
         "Place" = "Premis.Desc",
         "Weapon_Used" = "Weapon.Desc",
         "Status" = "Status.Desc")

str(crimes)
dim(crimes)

crimes$Crime_ID <- as.character(crimes$Crime_ID)
crimes$Date_Reported <- mdy_hms(crimes$Date_Reported)
crimes$Date_Occured <- mdy_hms(crimes$Date_Occured)

newest = arrange(desc(crime))

         