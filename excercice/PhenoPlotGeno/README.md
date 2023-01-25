# Regional plot 
##Description data

Genotype data and summary statistics has been obtained from
* 500 individuals from 1000 genome projects in plink format.
* summary statistics 87,793 positions from chromosome 7 in the interval 77727734-79727734
* phenotypes has been simulated from result of diabetes extracted from gwas catalog
* gwas had been obtained using h3agwas pipeline and gemma software


## Scripts description 
Objectif is to run your phenotype in function of you genotype
plot example using positions 78727734 on chromosome 17

### Pre requirement
* [locus zoom Standalone](https://genome.sph.umich.edu/wiki/LocusZoom_Standalone)
 * R (tested on 3.6, unix )
 * plink
 * sh or bash

### using R base

#### Installation 
see prerequirement

#### Run
* see `phenodisgeno.r`

### using ggplot, ggpubr 
customised boxplot, allowed gxe plot....
#### Installation
* R-library :
 * ggplot2
 * ggpubr
 * optparse
 * gridExtra
```
install.packages('ggplot2')
install.package"ggpubr", "optparse", "gridExtra"
```

#### run 
 * see `an_plotboxplot.r` R-script from [h3agwas/utils/annotation](https://github.com/h3abionet/h3agwas/tree/master/utils/annotation)
 * example of run in `extract_genoanboxplot.bash`



