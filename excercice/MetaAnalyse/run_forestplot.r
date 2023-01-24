library(data.table)
## 


DataAFR<-fread('data/AFR_pheno.gemma');
DataEUR<-fread('data/EUR_pheno.gemma')
DataAMR<-fread('data/AMR_pheno.gemma')
DataEAS<-fread('data/EAS_pheno.gemma')
DataSAS<-fread('data/SAS_pheno.gemma')
DataMeta<-fread('data/metal_res_metal.format')

chr=17
bp<-78727734
## format and select bp of interrest
DataAFR_chrbp<-DataAFR[DataAFR$chr==chr & DataAFR$ps==bp,c('allele1', 'allele0', 'af','beta','se','p_wald')];names(DataAFR_chrbp)<-c('A1','A2', 'AF', 'mean','SE', 'P')
DataSAS_chrbp<-DataSAS[DataSAS$chr==chr & DataSAS$ps==bp,c('allele1', 'allele0', 'af','beta','se','p_wald')];names(DataSAS_chrbp)<-c('A1','A2', 'AF', 'mean','SE', 'P')
DataEAS_chrbp<-DataEAS[DataEAS$chr==chr & DataEAS$ps==bp,c('allele1', 'allele0', 'af','beta','se','p_wald')];names(DataEAS_chrbp)<-c('A1','A2', 'AF', 'mean','SE', 'P')
DataAMR_chrbp<-DataAMR[DataAMR$chr==chr & DataAMR$ps==bp,c('allele1', 'allele0', 'af','beta','se','p_wald')];names(DataAMR_chrbp)<-c('A1','A2', 'AF', 'mean','SE', 'P')
DataEUR_chrbp<-DataEUR[DataEUR$chr==chr & DataEUR$ps==bp,c('allele1', 'allele0', 'af','beta','se','p_wald')];names(DataEUR_chrbp)<-c('A1','A2', 'AF', 'mean','SE', 'P')
DataMeta_chrbp<-DataMeta[DataMeta$CHRO==chr & DataMeta$BP==bp,c('Allele1', 'Allele2', 'Freq1','Effect','StdErr','P-value')];names(DataMeta_chrbp)<-c('A1','A2', 'AF', 'mean','SE', 'P')
## DataMeta doesn't have same ref / alt we swithch
DataMeta_chrbp$mean<- - DataMeta_chrbp$mean;DataMeta_chrbp$AF <- 1 - DataMeta_chrbp$AF 

Data_reschrbp<-rbind(DataAFR_chrbp,DataSAS_chrbp,DataEAS_chrbp, DataAMR_chrbp,DataEUR_chrbp,DataMeta_chrbp)
Data_reschrbp<-cbind(Pop=c('AFR','SAS', 'EAS','AMR', 'EUR', 'Meta'), Data_reschrbp, is.summary=c(F,F,F,F,F,T))
Data_reschrbp$index<-nrow(Data_reschrbp):1

# we computed lower and upper using 95%
Data_reschrbp$lower<- Data_reschrbp$mean-1.96 * Data_reschrbp$SE
Data_reschrbp$upper<- Data_reschrbp$mean+1.96 * Data_reschrbp$SE

Data_reschrbp_2<-Data_reschrbp[,c('Pop','AF', 'P', 'mean', 'lower', 'upper')]

# source https://www.r-bloggers.com/2022/09/forest-plot-in-r-quick-guide/
library(ggplot2)
ggplot(data=Data_reschrbp, aes(y=index, x=mean, xmin=lower, xmax=upper)) +
  geom_point() +
  geom_errorbarh(height=.1) +
  scale_y_continuous(breaks=1:nrow(Data_reschrbp), labels=Data_reschrbp$Pop) +
  labs(title='Effect Size by Study', x='Effect Size', y = 'Study') +
  geom_vline(xintercept=0, color='black', linetype='dashed', alpha=.5) +
  theme_classic()
ggsave("meta_ggplot.pdf")


#install.packages("https://cran.r-project.org/src/contrib/Archive/forestplot/forestplot_2.0.1.tar.gz")
library(forestplot)
jpeg('forestplot_lib_meta.jpeg')
forestplot(Data_reschrbp_2[,c('Pop','AF','P')], mean=Data_reschrbp_2$mean, lower=Data_reschrbp_2$lower, upper=Data_reschrbp_2$upper, is.summary=Data_reschrbp$is.summary)
dev.off()

Data_reschrbp_2 %>%
       forestplot(mean = mean,lower = lower,upper = upper,
                  labeltext = c('Pop','AF','P'),
                  title = paste("chr", chr, ":",bp,sep=''),
                  xlab = "Estimates",
                  new_page = TRUE
                  )


#http://xai-tools.drwhy.ai/forestmodel.html


