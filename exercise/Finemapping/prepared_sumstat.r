library(data.table)
# load summary statistics
datasumstat<-fread('data/data_regplot.gemma')

# load info plink file for position, information 1 and 4 contains chr bp
databim<-fread('data/chr17_77727734_79727734.bim', header=F)
## we keep only positions in 
datasumstatclean<-merge(datasumstat, databim[,c(1,4)],by.x=c('chr','ps'),by.y=c("V1","V4"), all=F)
## defined variable to defined chromosome, position and positions around 
chro<-17;pos<-78727734;around=100000
# we selected positions around chr and pos
datasumstatclean2<-datasumstatclean[datasumstatclean$chr==chro & datasumstatclean$ps>(pos-around) & datasumstatclean$ps<(pos+around),]
# select column of interrest and change header, finemap need maf
datasumstatclean2<-datasumstatclean2[,c('rs', 'chr', 'ps', 'allele1', 'allele0', 'maf', 'beta','se')]
names(datasumstatclean2)<-c('rsid', 'chromosome', 'position', 'allele1', 'allele2', 'maf', 'beta','se')
# write new summary statistics
write.table(datasumstatclean2, quote=F, row.names=F, col.names=T, file='data/sumstat.z',sep=' ')
## build a bed file for plink and build LD
write.table(datasumstatclean2[,c('chromosome', 'position', 'position','rsid')], quote=F, row.names=F, col.names=T, file='data/sumstat.bed',sep='\t')
