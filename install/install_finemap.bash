
mkdir -p bin/
wget -c http://www.christianbenner.com/finemap_v1.4.1_x86_64.tgz .
tar -xzf finemap_v1.4.1_x86_64.tgz
cp finemap_v1.4.1_x86_64/finemap_v1.4.1_x86_64 ./bin/finemap
chmod +x ./bin/finemap
./bin/finemap -h
