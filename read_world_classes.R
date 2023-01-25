library(tidyverse) # for dplyr
library(jsonlite)  # for json
library(rjson)
library(RJSONIO)
library(readxl)    # for xlsx
library(haven)     # for sas7bdat
library(arsenal)   # for comparing data frames

#read csv with dplyr::read_csv
dplyr_read_csv <- read_csv("World Class.csv")

#read csv with base::read.csv() with check names==T
base_read_csv_T <- read.csv("World Class.csv")
colSums(base_read_csv_T != dplyr_read_csv)
setdiff(dplyr_read_csv, base_read_csv_T)

#read csv with base::read.csv() with check names==F
base_read_csv_F <- read.csv("World Class.csv",
                            check.names = FALSE)
colSums(base_read_csv_T != dplyr_read_csv)
setdiff(dplyr_read_csv, base_read_csv_F)

#read csv with base::read.table()
base_read_table <- read.table("World Class.csv", 
                              sep=",", 
                              header=TRUE, 
                              check.names=FALSE)
colSums( base_read_table != dplyr_read_csv)
setdiff(dplyr_read_csv, base_read_table)

#read Tab-delimited values with dplyr::read_tsv
dplyr_read_tsv <- read_tsv("World Class.txt")
colSums(base_read_table != dplyr_read_csv)
setdiff(dplyr_read_csv, base_read_table)

#read JSON file with jsonlite::fromJSON()
jsonlite_fromJSON <- jsonlite::fromJSON("World Class.json")
colSums(jsonlite_fromJSON != dplyr_read_csv)
setdiff(dplyr_read_csv, jsonlite_fromJSON)

#read JSON file with rjson::fromJSON
raw_JSON <- rjson::fromJSON(file = "World Class.json")
rjson_fromJSON <- do.call(rbind.data.frame, raw_JSON)
colSums(rjson_fromJSON != dplyr_read_csv)
setdiff(dplyr_read_csv, rjson_fromJSON)

# #read JSON file with RJSONIO::fromJSON
# raw_JSON <- RJSONIO::fromJSON("World Class.json")
# rjson_fromJSON <- do.call(rbind.data.frame, raw_JSON)
# colSums(rjson_fromJSON != dplyr_read_csv)
# setdiff(dplyr_read_csv, rjson_fromJSON)
# comparedf(dplyr_read_csv, rjson_fromJSON) |> 
#   summary()

#read xlsx file with readxl::readxlsx
readxl_read_xlsx <-  read_xlsx("World Class.xlsx")
class(colSums(readxl_read_xlsx != dplyr_read_csv))
setdiff(dplyr_read_csv, readxl_read_xlsx)
comparedf(dplyr_read_csv, readxl_read_xlsx) |> 
  summary()

#read sas transport file with haven::read_xpt()
haven_read_xpt <- read_xpt("WORLD_CL.stx")
comparedf(dplyr_read_csv, haven_read_xpt) |> 
  summary()

#read SAS-generated sasv7bdat file with haven::read_sas
haven_read_sas <- read_sas("World_Class_SAS.sas7bdat")
colSums(haven_read_sas != dplyr_read_csv)
setdiff(dplyr_read_csv, haven_read_sas)
comparedf(dplyr_read_csv, haven_read_sas) |> 
  summary()

#read JMP-generated sasv7bdat file with haven::read_sas
haven_read_sas <- read_sas("World_Class_JMP.sas7bdat")
