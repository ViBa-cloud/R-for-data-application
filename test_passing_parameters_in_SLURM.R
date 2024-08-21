#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
workspace_directory = as.array(args[1])
file_to_query = as.array(args[2])

print(workspace_directory)
print(file_to_query)

#workspace_directory=c("/nfs/socr/MIMIC3")
#filename <- file.path(workspace_directory,"MIMIC3.csv")

filename <- file.path(workspace_directory,file_to_query)
print(filename)

system.time()
# datasifter calls....
source("datasifter.R")
datasifter(......)
