# Manhattan plots 
## description data
two dataset in `assoc` folder contains two subsample of summary statistics. 
Summary statistics had been obtained :
* 500 individuals from 1000 genome projects
* 50,000 positions 
* phenotypes has been simulated from result of diabetes extracted from gwas catalog
* gwas had been done using h3agwas pipeline and gemma software
* see (h3agwas-example)[https://github.com/h3abionet/h3agwas-examples] 


## Scripts description 

### pre requirement
* R (tested on 3.6, unix tested)
* R-lib :
 * devtools
 * data.table

###qqman library
qqman is a R-library to plot Manhattan plot and  QQ-plot
####Installation
```
#install.package
install.packages('qqman')
```
####example run
* `man_qqman.r` : script example to plot Manhattan

###Fastman
* fastman is a R-library to do Manhattan plot with more option than `qqman` as lead SNPs

####Installation

```
devtools::install_github('kaustubhad/fastman')
```

####example run
* `man_qqman.r` : script example to plot Manhattan

### Hudson library
Hudson is a R-library to plot Manhattan plot and also two manhantan plot in mirror

####Installation
```
#install.package
devtools::install_github('anastasia-lucas/hudson')
install.packages('ggrepel')
```
####example run
* `man_hudson.r` : script example to plot Manhattan using hudson library

