# Forest plot of meta analysis
## description data
6 summary statistics dataset in `data` folder contains 
* 5 gwas result using gemma 
* 1 meta analysis of 5 gwas using gemma
Summary statistics had been obtained :
* using each meta pop from 1000 genome projects :
 * AFR, African
 * AMR, Ad Mixed American
 * EAS, East Asian
 * EUR, European
 * SAS, South Asian
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
* ggplot2
* forestplot
### RUN  
 * script see (`run_forestplot.r`)

