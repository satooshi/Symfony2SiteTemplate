#!/bin/sh

bin_dir=`dirname $0`
root_dir=`cd ${bin_dir}; cd ../;pwd`

cd $root_dir

sudo rm -rf app/cache/* composer.lock vendor
composer install > composer.log
sudo rm -rf app/cache/*
rm -f vendor.tar.gz
tar zcvf vendor.tar.gz vendor  >/dev/null 2>&1

cat composer.log
