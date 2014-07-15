#!/bin/bash

VERSION=${1:-"1.5.8.1"}
PKG=ngx_openresty-$VERSION

apt-get update
apt-get install -y libpcre3-dev build-essential libssl-dev sudo libreadline-dev libncurses5-dev libpcre3-dev libssl-dev perl make

wget http://openresty.org/download/${PKG}.tar.gz

tar xzf ${PKG}.tar.gz
cd $PKG

./configure --prefix=/usr/local/openresty/ \
    --with-luajit \

make
make install

apt-get install -y lua5.1 luarocks
luarocks install moonscript
luarocks install lapis

cd /vagrant
lapis new
