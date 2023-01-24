# import library
library(data.table) ## allow to read big file using fread function
library(qqman)
data_sumstat<-fread('assoc/result.plink') # reading summary statistics
qq(data_sumstat$P) ## implemented same line than before.
