FROM ubuntu:20.04

ENV PYTHONNOUSERSITE 1

MAINTAINER JTB 

RUN apt-get update -qq
# install two helper packages we need
RUN apt install -y dirmngr apt-transport-https ca-certificates software-properties-common 
RUN apt-get install r-base  r-base-dev r-cran-devtools r-recommended -y


RUN apt-get install -y plink1.9
RUN ln -s /usr/bin/plink1.9   /usr/bin/plink

RUN apt-get install build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev libfontconfig1-dev libharfbuzz-dev libfribidi-dev libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev cmake -y
RUN apt-get install r-cran-car -y
RUN R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/pbkrtest/pbkrtest_0.4-8.6.tar.gz')"
RUN R -e "install.packages(\"devtools\", repos='cran.r-project.org/')"
RUN R -e "devtools::install_github('kassambara/ggpubr')"
RUN R -e "install.packages(\"qqman\", repos='cran.r-project.org/')"
RUN R -e "install.packages(\"data.table\", repos='cran.r-project.org/')"
RUN R -e "install.packages(\"optparse\", repos='cran.r-project.org/')"
RUN R -e "install.packages(\"ggplot2\", repos='cran.r-project.org/')"
RUN R -e "install.packages(\"gridExtra\", repos='cran.r-project.org/')"
RUN R -e "devtools::install_github('kaustubhad/fastman')"
RUN R -e "devtools::install_github('anastasia-lucas/hudson')"
# dependency for forestplot
RUN R -e "install.packages(\"checkmate\", repos='cran.r-project.org/')"
RUN R -e "install.packages(\"https://cran.r-project.org/src/contrib/Archive/forestplot/forestplot_2.0.1.tar.gz\")"
RUN apt-get install wget -y
RUN wget http://www.christianbenner.com/finemap_v1.4_x86_64.tgz && tar -xzf finemap_v1.4_x86_64.tgz
RUN mv /finemap_v1.4_x86_64/finemap_v1.4_x86_64 /usr/bin/finemap && chmod +x /usr/bin/finemap
RUN rm -rf finemap_v1.4_x86_64*

