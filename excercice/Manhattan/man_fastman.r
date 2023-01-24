# import library
library(data.table) ## allow to read big file using fread function
#devtools::install_github('kaustubhad/fastman')
library(fastman)
data_sumstat<-fread('assoc/asso_phenoqt2.gemma') # reading summary statistics
# identify colums contains p-value
head(data_sumstat, 2)
# dimension of data
png('man_fastman.png', width = 480*2, height = 480)
fastman(data_sumstat,  chr = "chr", bp = "ps", p = "p_wald", snp="rs",annotatePval=5E-8)
dev.off()

