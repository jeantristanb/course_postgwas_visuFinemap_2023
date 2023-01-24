module load plink/v1.90b6.25 

plinkbase=data/chr7_77727734_79727734
filers=data/17_78727734.bed
echo "17	78727734	78727734	17:78727734" > $filers
# format in ped file 
out=data/17_78727734bp
plink -bfile $plinkbase --extract range $filers  --recode tab --out $out

data=data/KGPH3abionetsub_pheno_qt.pheno
outpdf=h3agwas_geno.pdf
pheno=pheno_1
./an_plotboxplot.r --ped $out".ped" --data $data --out $outpdf --pheno $pheno $cov_plot_geno $gxe_cov_geno
#
