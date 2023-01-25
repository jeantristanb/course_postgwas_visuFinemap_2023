# QQ-plots 

## description data
one dataset in `assoc` folder contains subsample of summary statistics. 
Summary statistics had been obtained :
* 500 individuals from 1000 genome projects
* 50,000 positions 
* phenotypes has been simulated from result of diabetes extracted from gwas catalog
* gwas had been done using h3agwas pipeline and plink software
* see [h3agwas-example](https://github.com/h3abionet/h3agwas-examples) 


## Scripts description 

### pre requirement
* R (tested on 3.6, unix tested)
* R-lib :
 * devtools
 * data.table

### own qq plot

#### Installation
see pre requirement section

#### example run 
* see `qq_manuals.r` 

### qqman library
qqman is a R-library to plot Manhattan plot and  QQ-plot
#### Installation
```
#install.package
install.packages('qqman')
```
#### example run
* `man_qqman.r` : script example to do QQ-plot

### Fastman
* fastman is a R-library to do a QQ plot

#### Installation

```
devtools::install_github('kaustubhad/fastman')
```

#### example run
* `man_qqman.r` : script example to plot a qq plot


### compute inflation factors

Computed your own inflation factors

#### Installation
see pre requirement section

#### example run 
* see `qq_lambda.r` 


## Using locuszoom web interface
 * see (example in locuszoomV2)[https://my.locuszoom.org/gwas/91333/ ]

