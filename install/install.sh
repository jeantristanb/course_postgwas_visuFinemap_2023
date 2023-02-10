sudo  apt install r-base r-cran-car r-cran-devtools \
            build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev \
            libfontconfig1-dev libharfbuzz-dev libfribidi-dev \
            libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev cmake

sudo R --save << EOF
install.packages('https://cran.r-project.org/src/contrib/Archive/pbkrtest/pbkrtest_0.4-8.6.tar.gz')
install.packages('devtools',  repos='cran.r-project.org/')
install.packages('data.table', repos='cran.r-project.org/')
install.packages('qqman',  repos='cran.r-project.org/')
install.packages('ggplot2',  repos='cran.r-project.org/')
install.packages("gridExtra",  repos='cran.r-project.org/')
install.packages("optparse", repos='cran.r-project.org/')
devtools::install_github('kaustubhad/fastman')
devtools::install_github('anastasia-lucas/hudson')
devtools::install_github('kassambara/ggpubr')
install.packages("checkmate", repos='cran.r-project.org/')
install.packages("https://cran.r-project.org/src/contrib/Archive/forestplot/forestplot_2.0.1.tar.gz")
EOF
