## download data
## reading with 
Data<-read.table('course_h3abionet_2023.gemma')
## reading with data.table fread 
library(data.table)
Data<-fread('course_h3abionet_2023.gemma')
## 

## check column
ncol(Data)
## check row or number snps
nrow(Data)

## determine your chr, pos ... header
head(Data)

## check if you have maf 0.01

table(Data$af<0.01 | Data$af>0.99)

chrom<-17;pos<-78727734;around<-1000000 #and around positions 78727734 with a windows of 1 MB
Datasub<-Data[Data$chr==chrom & Data$ps>=(pos-around) & Data$ps<=(pos+around),]

## obtained positions with minimum p-value : 78757626
Datasub[which.min(Datasub$p_wald) ,]


