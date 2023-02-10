# import library
## reading with data.table fread 
library(data.table)
# comparison of two function to read data
Data<-read.table('course_h3abionet_2023.gemma', header=T)
Data<-fread('course_h3abionet_2023.gemma')
## check column number
ncol(Data)
## check row or number snps
nrow(Data)
## determine your header of chr, pos ... header
head(Data)
## check if you have maf 0.01
table(Data$af<0.01 | Data$af>0.99)
## selection of you chromosme and positions around
chrom<-17;pos<-78727734;around<-1000000 #and around positions 78727734 with a windows of 1 MB
Datasub<-Data[Data$chr==chrom & Data$ps>=(pos-around) & Data$ps<=(pos+around),]
## obtained positions with minimum p-value : 78757626
Datasub[which.min(Datasub$p_wald) ,]
