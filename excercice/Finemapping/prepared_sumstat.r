library(data.table)
# load summary statistics
datasumstat<-fread('data/data_regplot.gemma')
# load info plink file for position, information 1 and 4 contains chr bp
databim<-fread('data/chr17_77727734_79727734.bim', header=F)
## we keep only positions in 
datasumstatclean<-merge(datasumstat, databim[,c(1,4)],by.x=c('chr','ps'),by.y=c("V1","V4"), all=F)
## 
chro<-17
pos<-78727734
around=100000

# we selected positions around chr and pos
datasumstatclean2<-datasumstatclean[datasumstatclean$chr==chro & datasumstatclean$ps>(pos-around) & datasumstatclean$ps<(pos+around),]
#rsid chromosome position allele1 allele2 maf beta se
#rs1 10 1 T C 0.35 0.0050 0.0208
## transformed af in maf
datasumstatclean2$maf<-datasumstatclean2$af
datasumstatclean2$maf[datasumstatclean2$af>0.5]<- 1 - datasumstatclean2$af[datasumstatclean2$af>0.5]
datasumstatclean2<-datasumstatclean2[,c('rs', 'chr', 'ps', 'allele1', 'allele0', 'maf', 'beta','se')]
names(datasumstatclean2)<-c('rsid', 'chromosome', 'position', 'allele1', 'allele2', 'maf', 'beta','se')
write.table(datasumstatclean2, quote=F, row.names=F, col.names=T, file='data/sumstat.z',sep=' ')
write.table(datasumstatclean2[,c('chromosome', 'position', 'position','rsid')], quote=F, row.names=F, col.names=T, file='data/sumstat.bed',sep='\t')
