module load plink/v1.90b6.25 
## obtained information relative to database
#/dataE/AWIGenGWAS/shared/ResultGWAS/Ressource/locuszoom/bin/locuszoom --help

#we format file in epact 
echo -e "#CHROM\tBEGIN\tEND\tMARKER_ID\tPVALUE" > data/data_regplot.epact
# to
sed '1d' data/data_regplot.gemma |awk '{print $1"\t"$3"\t"$3"\t"$2"\t"$12}' >> data/data_regplot.epact


#/dataE/AWIGenGWAS/shared/ResultGWAS/Ressource/locuszoom/bin/locuszoom --build hg19 --epacts  data/data_regplot.epact --source 1000G_Nov2014 --pop EUR --chr 17 --start 77727734 --end 79727734

# --gwas-cat
## 
/dataE/AWIGenGWAS/shared/ResultGWAS/Ressource/locuszoom/bin/locuszoom --build hg19 --epacts  data/data_regplot.epact --source 1000G_Nov2014 --pop EUR --chr 17 --start 77727734 --end 79727734 --gwas-cat whole-cat_significant-only -p gwascat


## plot using your own LD
#chr17:78727734chr17:78727734
plink -bfile data/chr7_77727734_79727734      --ld-window-kb 10000 --ld-snp  17:78727734:T:C  --ld-window 99999  --ld-window-r2 0 -out data/chr7_77727734_79727734 --r2 
# CHR_A         BP_A             SNP_A  CHR_B         BP_B             SNP_B           R2 
echo -e "snp1\tsnp2\tdprime\trsquare" > data/chr7_77727734_79727734_lz.ld
sed '1d' data/chr7_77727734_79727734.ld | awk '{print "chr"$1":"$2"\tchr"$1":"$5"\tNA\t"$7}' >> data/chr7_77727734_79727734_lz.ld

/dataE/AWIGenGWAS/shared/ResultGWAS/Ressource/locuszoom/bin/locuszoom --build hg19 --epacts  data/data_regplot.epact --chr 17 --start 77727734 --end 79727734 --gwas-cat whole-cat_significant-only --ld data/chr7_77727734_79727734_lz.ld -p gcld  
