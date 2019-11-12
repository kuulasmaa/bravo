#!/bin/sh

user=ubuntu
base_dir=$PWD

# prepare system (Ubuntu 18.04)
apt-get install build-essential zlib1g-dev libbz2-dev liblzma-dev  autoconf automake bzip2 curl g++ gcc libcurl4-gnutls-dev libssl-dev make perl wget cmake
apt-get install git screen mongodb nginx apache2-utils

pip2.7 install -r requirements.txt

# create data directories
mkdir -p /data/cache/igv_cache
mkdir -p /data/cram
mkdir -p /data/genomes
mkdir -p /data/coverage
mkdir -p /data/import_vcf

cd ${base_dir}
deploy/INSTALL.sh -b hg19 -t 2

# compile data prep tools
cd ${base_dir}/data/DataPrep
cget install .

chown -R ${user}.${user} /data ${base_dir}

#############################################
#
# ngixn web proxy server
#
cp config/ngingx.conf /etc/nginx/

systemctl enable nginx
service nginx restart

#############################################
#
# setup mongodb server
#
systemctl enable mongodb
service mongodb restart
