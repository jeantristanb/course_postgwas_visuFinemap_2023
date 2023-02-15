# Fine Mapping
## Description data

Genotype data and summary statistics has been obtained from
* 500 individuals from 1000 genome projects in plink format.
* summary statistics 6,300 positions from chromosome 7 in the interval 77727734-79727734
* phenotypes has been simulated from result of diabetes extracted from gwas catalog
* gwas had been obtained using h3agwas pipeline and gemma software


## Scripts description 

### Pre requirement
* [locus zoom Standalone](https://genome.sph.umich.edu/wiki/LocusZoom_Standalone)
 * R (tested on 3.6, unix tested)
 * python2.7
 * plink
 * sh or bash

### install Finemap (unix)

```
wget -c http://www.christianbenner.com/finemap_v1.4.1_x86_64.tgz .
tar -xzf finemap_v1.4.1_x86_64.tgz 
cp finemap_v1.4.1_x86_64/finemap_v1.4.1_x86_64 ./bin/finemap
chmod +x ./bin/finemap
./bin/finemap -h
```

### example description

we will run [FINEMAP](http://www.christianbenner.com/) software, with previous dataset used in regional plot, we will prepared data, extract lead SNPs and credible set at 95 %. we will select position around chromosome 17 positions 78727734 using a windows of 100kb

### Prepare your data
as input, FINEMAP :
* config file contains input and ouput
* summary statistics format
* ld file in square
* information of sumarry statistics must be same position that ld file


### Format sumarry statistics 
we used a r-script to open summary statistics, select positions around SNPs of interrest and positions present than genetic file format header using FINEMAP manual, furthermore we will create a bed file (-interval-) to 
* script `prepared_sumstat.r`

## build LD matrix
LD matrix in input as specific characteristics, must be square, and separated by space not tab.
 * file `data/sumstat.bed` created by R script `prepared_sumstat.r`

```
plink --r2 square0 yes-really -bfile data/chr17_77727734_79727734 -out "data/tmp" --extract range data/sumstat.bed
## format for fine map : change nan in 0
sed 's/\t/ /g' data/tmp.ld | sed 's/nan/0/g' > data/ld_chr17_finemap.ld
```
### prepared your config finemap
config file gave as input is a semi comma separated, contains for each column :
 * `z` : summary statistics file 
 * `ld` : LD file 
 * `snp` : output file is a space-delimited text file. It contains the GWAS summary statistics and model-averaged posterior summaries for each SNP one per line.
 * `config` :  output file is a space-delimited text file. It contains the posterior summaries for each causal configuration one per line 
 * `cred` :  output file is a space-delimited text file. It contains the 95% credible sets for each causal signal in the genomic region.
 * `log` :  file outputs additional information. 
 * `n_samples` : sample number done by GWAS.

```
echo "z;ld;snp;config;cred;log;n_samples" > data/finemap.config
echo "data/sumstat.z;data/ld_chr17_finemap.ld;data/finemapout.snp;data/finemapout.config;data/finemapout.cred;data/finemapout.log;500" >> data/finemap.config
```

### Run finemaping
* `n-causal-snps` : Option to set the maximum number of allowed causal SNPs
* `prob-cred-set` : Option to set the probability at which the credible interval includes a causal SNP
* `cond-pvalue` : minimum p-value to consider
```
bin/finemap --cond --in-files data/finemap.config   --log --cond-pvalue 0.00000005  --n-causal-snps 5  --prob-cred-set 0.95
```

