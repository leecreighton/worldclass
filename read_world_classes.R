library(tidyverse) # for dplyr
library(jsonlite)  # for json
library(readxl)    # for xlsx
library(haven)     # for sas7bdat
library(arsenal)   # for comparing data frames


#read CSV with dplyr::read_csv
dplyr_read_csv <- read_csv("World Class.csv")

#read csv with base::read.csv()
base_read_csv <- read.csv("World Class.csv",
                          check.names = FALSE)
comparedf(dplyr_read_csv, base_read_csv) |> 
  summary()

#read cssv with base::read.table()
base_read_table <- read.table("World Class.csv", 
                              sep=",", 
                              header=TRUE, 
                              check.names=FALSE)

#read Tab-delimited values with dplyr::read_tsv
dplyr_read_tsv <- read_tsv("World Class.txt")

#read JSON file with jsonlite::fromJSON()
json_fromJSON <- fromJSON("World Class.json")

#read xlsx file with readxl::readxlsx
readxl_read_xlsx <-  read_xlsx("World Class.xlsx")
comparedf(dplyr_read_csv, readxl_read_xlsx) |> 
  summary()

#read sasv7bdat file with haven::read_sas
haven_read_sas <- read_sas("World_Class.sas7bdat")

#read sas transport file with haven::read_xpt()
haven_read_xpt <- read_xpt("WORLD_CL.stx")
