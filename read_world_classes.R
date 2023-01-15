library(tidyverse) # for dplyr
library(jsonlite)  # for json
library(readxl)    # for xlsx
library(haven)     # for sas7bdat
library(arsenal)   # for comparing data frames

#read csv with dplyr::read_csv
dplyr_read_csv <- read_csv("World Class.csv")

#read csv with base::read.csv() with check names==T
base_read_csv_T <- read.csv("World Class.csv")
setdiff(dplyr_read_csv, base_read_csv_T)

#read csv with base::read.csv() with check names==F
base_read_csv_F <- read.csv("World Class.csv",
                            check.names = FALSE)
setdiff(dplyr_read_csv, base_read_csv_F)
comparedf(dplyr_read_csv, base_read_csv_F) |> 
  summary()

#read csv with base::read.table()
base_read_table <- read.table("World Class.csv", 
                              sep=",", 
                              header=TRUE, 
                              check.names=FALSE)
comparedf(dplyr_read_csv, base_read_table) |> 
  summary()

#read Tab-delimited values with dplyr::read_tsv
dplyr_read_tsv <- read_tsv("World Class.txt")
comparedf(dplyr_read_csv, dplyr_read_tsv) |> 
  summary()

#read JSON file with jsonlite::fromJSON()
jsonlite_fromJSON <- fromJSON("World Class.json")
comparedf(dplyr_read_csv, jsonlite_fromJSON) |> 
  summary()

#read xlsx file with readxl::readxlsx
readxl_read_xlsx <-  read_xlsx("World Class.xlsx")
comparedf(dplyr_read_csv, readxl_read_xlsx) |> 
  summary()

#read sas transport file with haven::read_xpt()
haven_read_xpt <- read_xpt("WORLD_CL.stx")
comparedf(dplyr_read_csv, haven_read_xpt) |> 
  summary()

#read SAS-generated sasv7bdat file with haven::read_sas
haven_read_sas <- read_sas("World_Class_SAS.sas7bdat")
comparedf(dplyr_read_csv, haven_read_sas) |> 
  summary()

#read JMP-generated sasv7bdat file with haven::read_sas
haven_read_sas <- read_sas("World_Class_JMP.sas7bdat")
comparedf(dplyr_read_csv, haven_read_sas) |> 
  summary()
