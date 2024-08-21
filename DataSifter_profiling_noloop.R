args = commandArgs(trailingOnly=TRUE)
levels_to_obfuscate = as.array(args[1])
#file_to_query = as.array(args[2])

library(doSNOW)
library(wordspace)
df_raw <- read.csv("~/DataSifter/df_raw.csv", row.names = NULL,
                        stringsAsFactors = T)
df_raw[1:2,1:5]
source("~/DataSifter/rpacksifter-Feb2022_with_notes.R")
#levels = c("none","small","medium","large","indep")
levels = c("small","medium","large","indep")
# dataSifter <- 
#   function(level="indep",data,unstructured.names=NULL,subjID=NULL,
#            batchsubj=1000,missingback=FALSE,usecore=2,col_preserve = 0.5,
#            col_pct = 0.7,nomissing=FALSE,k0=NA,k1=NA,k2=NA,k3=NA,k4=NA,
#            maxiter=1)

start_time <- Sys.time()
## Here I generate 4 clones of obfuscated data from the raw data,
## one for each level

  SiftedData <- dataSifter(
    level = levels_to_obfuscate,
    #level = levels[i],
    data = df_raw,
    subjID="ID",
    batchsubj = min(200, (dim(df_raw)[1]) / 2),
    maxiter = 1, nomissing = T, usecore = 2)
  eval(parse(text = paste0("SiftedData_", levels[i], " <- SiftedData")))

  # for (i in 1 :length(levels))
# {
#   SiftedData <- dataSifter(
#     level = levels_to_obfuscate
#     #level = levels[i],
#     data = df_raw,
#     subjID="ID",
#     batchsubj = min(200, (dim(df_raw)[1]) / 2),
#     maxiter = 1, nomissing = T, usecore = 2)
#   eval(parse(text = paste0("SiftedData_", levels[i], " <- SiftedData")))
# }
end_time <- Sys.time()
cpu_time <- end_time - start_time
cpu_time