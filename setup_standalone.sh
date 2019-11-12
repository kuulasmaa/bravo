#!/bin/sh

mkdir -p /data/cache/igv_cache
mkdir -p /data/cram
mkdir -p /data/genomes
mkdir -p /data/coverage
mkdir -p /data/import_vcf
chown -R ubuntu.ubuntu /data

apt-get install build-essential zlib1g-dev libbz2-dev liblzma-dev  autoconf automake bzip2 curl g++ gcc libcurl4-gnutls-dev libssl-dev make perl wget cmake
apt-get install git screen mongodb nginx apache2-utils

pip install -r requirements.txt

