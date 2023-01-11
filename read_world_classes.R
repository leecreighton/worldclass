library(tidyverse) # for dplyr
library(rjson)     # for json
library(readxl)    # for xlsx
library(haven)     # for sas7bdat


#read CSV with read_csv
dplyr_read_csv <- read_csv("World Class.csv")

#read csv with read.csv
base_read_csv <- read.csv("World Class.csv")

#read Tab-delimited values with read_tsv
dplyr_read_tsv <- read_tsv("World Class.txt")

#read JSON with rjson
#read raw json data
raw_json_data <- read_file("World Class.json")
test_json <- fromJSON(raw_json_data)
as.data.frame(test_json)
rjson_json <- fromJSON(file = "World Class.json") |> 
  as.data.frame()

#read xlsx file
readxl_read_xls <-  read_xlsx("World Class.xlsx")

#read sasv7bdat file
haven_read_sas <- read_sas("World_Class.sas7bdat")
haven_read_stx <- read_xpt("WORLD_CL.stx")
