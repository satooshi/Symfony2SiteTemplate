#!/bin/sh

root_dir=/usr/local/prj/github/Symfony2SiteTemplate

cd ${root_dir}

sudo rm -rf app/cache/* composer.lock vendor
composer install > composer.log
sudo rm -rf app/cache/*
rm -f vendor.tar.gz 
tar zcvf vendor.tar.gz vendor  >/dev/null 2>&1
