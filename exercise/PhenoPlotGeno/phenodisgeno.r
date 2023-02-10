## reading pheno
pheno<-read.table('data/KGPH3abionetsub_pheno_qt.pheno', header=T)
## reading geno from plink output
geno<-read.table('data/17_78727734bp.ped')
geno<-geno[,c(1,2,7,8)]
names(geno)<-c('FID','IID', 'G1','G2')
geno$genot<-paste(geno$G1,geno$G2,sep='')
# name geno header=
genopheno<-merge(pheno , geno, by=c(1,2),all=F)
# boxplot by genotype
pdf('dist_genopheno.pdf')
boxplot(pheno_1~genot,data=genopheno, xlab='', ylab='phenotype')
dev.off()
