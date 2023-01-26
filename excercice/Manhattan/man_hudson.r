# import library
library(data.table) ## allow to read big file using fread function
#devtools::install_github('anastasia-lucas/hudson')
#install.packages('ggrepel')
library(hudson)
data_sumstat_1<-fread('data/asso_phenoqt1.gemma') # reading summary statistics
data_sumstat_2<-fread('data/asso_phenoqt2.gemma') # reading summary statistics
# data frame, must contain SNP, CHR, POS, pvalue, optional Shape
# select of column of interrest and change name, order is important.
data_sumstat_1<-data_sumstat_1[,c('rs', "chr",'ps', 'p_wald')];names(data_sumstat_1)<-c("SNP","CHR`","POS", "pvalue")
data_sumstat_2<-data_sumstat_2[,c('rs', "chr",'ps', 'p_wald')];names(data_sumstat_2)<-c("SNP","CHR`","POS", "pvalue")

# Create a basic plot with Bonferroni lines and highlighting using the toy gwas datasets
gmirror(top=data_sumstat_2, bottom=data_sumstat_1, tline=5*10**-8, bline=5*10**-8, toptitle="Data 1", bottomtitle = "Data 2", highlight_p = c(5*10**-8, 5*10**-8), annotate_p = c(5*10**-8, 5*10**-8), highlighter="black" ,file="man_hudson")
