#!/bin/bash

if ! getent group openresty >/dev/null; then
    addgroup --system openresty >/dev/null
fi

if ! getent passwd openresty >/dev/null; then
    adduser \
    --system \
    --disabled-login \
    --ingroup openresty \
    --no-create-home \
    --home /nonexistent \
    --gecos "openresty user" \
    --shell /bin/false \
    openresty  >/dev/null
fi

mkdir /var/cache/openresty || 2> /dev/null
cp initd /etc/init.d/openresty || 2> /dev/null
chmod +x /etc/init.d/openresty || 2> /dev/null

VERSION=${1:-"1.5.8.1"}
PKG=ngx_openresty-$VERSION

apt-get update
apt-get install -y libpcre3-dev build-essential libssl-dev sudo libreadline-dev libncurses5-dev libpcre3-dev libssl-dev perl make

wget http://openresty.org/download/${PKG}.tar.gz

tar xzf ${PKG}.tar.gz
cd $PKG

./configure --prefix=/usr/local/openresty/ \
    --with-luajit \
    --conf-path=/etc/openresty/openresty.conf \
    --error-log-path=/var/log/openresty/error.log \
    --http-log-path=/var/log/openresty/access.log \
    --pid-path=/var/run/openresty.pid \
    --lock-path=/var/run/openresty.lock \
    --http-client-body-temp-path=/var/cache/openresty/client_temp \
    --http-proxy-temp-path=/var/cache/openresty/proxy_temp \
    --http-fastcgi-temp-path=/var/cache/openresty/fastcgi_temp \
    --http-uwsgi-temp-path=/var/cache/openresty/uwsgi_temp \
    --http-scgi-temp-path=/var/cache/openresty/scgi_temp \
    --user=openresty --group=openresty

make
make install

apt-get install -y lua5.1 luarocks
luarocks install moonscript
luarocks install lapis

cd /vagrant
mkdir app
cd app
lapis new
