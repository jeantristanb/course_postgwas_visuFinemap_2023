module load plink/v1.90b6.25
# computed LD
plink --r2 square0 yes-really -bfile data/chr17_77727734_79727734 -out "data/tmp" --extract range data/sumstat.bed
## format for fine map : change nan in 0

sed 's/\t/ /g' data/tmp.ld | sed 's/nan/0/g' > data/ld_chr17_finemap.ld
rm data/tmp*
echo "z;ld;snp;config;cred;log;n_samples" > data/finemap.config
echo "data/sumstat.z;data/ld_chr17_finemap.ld;data/finemapout.snp;data/finemapout.config;data/finemapout.cred;data/finemapout.log;500" >> data/finemap.config
bin/finemap --cond --in-files data/finemap.config   --log --cond-pvalue 0.00000005  --n-causal-snps 5  --prob-cred-set 0.95

 
