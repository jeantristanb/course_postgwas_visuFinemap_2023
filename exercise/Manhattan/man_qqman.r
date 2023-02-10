# import library
library(qqman)
library(data.table) ## allow to read big file using fread function
data_sumstat<-fread('data/asso_phenoqt2.gemma') # reading summary statistics
#dentify colums contains p-value
head(data_sumstat, 2)
# dimension of data
dim(data_sumstat)

png('man_1.png',  width = 480*2, height = 480)
## used mamhattan function of qq with argument chro header, bp header, p header and snp header
manhattan(data_sumstat,chr = "chr",bp = "ps",p = "p_wald", snp='rs')
dev.off()


#we selected rs excluding chromosome 17
listrs_sig<-data_sumstat$rs[data_sumstat$chr!=17 & data_sumstat$p_wald<5*10**-8]
## for 17 we selected min pvalue
minpval17<-min(data_sumstat$p_wald[data_sumstat$chr==17 & data_sumstat$p_wald<5*10**-8])
## 
minrs_chr17<-data_sumstat$rs[data_sumstat$p_wald==minpval17 & data_sumstat$chr==17]

listrs_sig<-c(listrs_sig, minrs_chr17)

png('man_qqman.png',  width = 480*2, height = 480)
manhattan(data_sumstat,chr = "chr",bp = "ps",p = "p_wald", snp='rs', highlight=listrs_sig)
dev.off()



