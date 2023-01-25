# need python 2.7

# install plink

# install tabix 

#
dirinstall=/spaces/jeantristan/lz/
mkdir -p $dirinstall
cd $dirinstall
# we download locus zoom with data base
if [ ! -f locuszoom_1.4.tgz ]
then
wget -c https://statgen.sph.umich.edu/locuszoom/download/locuszoom_1.4.tgz
fi
untar
if [ ! -d  $dirinstall/locuszoom ]
then
tar -xzf locuszoom_1.4.tgz
fi
## update database
cd $dirinstall/locuszoom/bin/
python lzupdate.py
