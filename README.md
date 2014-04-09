tentacles
=========

Distributed HTTP proxy

```
sudo apt-get upgrade
sudo apt-get redis
sudo apt-get install libreadline-dev libncurses5-dev libpcre3-dev libssl-dev perl make
wget http://openresty.org/download/ngx_openresty-1.5.11.1.tar.gz
tar xzvf ngx_openresty
configure
make
make install

mkdir ~/work
cd ~/work
mkdir logs/ conf/

cd ~/work/conf
cp tentacles/conf/nginx.conf

PATH=/usr/local/openresty/nginx/sbin:$PATH
export PATH

# restart nginx
kill -15 `pgrep nginx`;nginx -p `pwd` -c conf/nginx.conf

# start with a test for upstream
kill -15 `pgrep nginx`;nginx -p `pwd` -c conf/nginx.conf;nginx -p `pwd` -c conf/upstream.conf;

cat /etc/hosts
127.0.0.1 flying-squirrel.myapp.com

# curl for root proxy
curl http://flying-squirrel.myapp.com/

# curl for redis data
curl http://127.0.0.1/redis_set?domain=flying-squirrel&endpoint=127.0.0.1:8081
curl http://127.0.0.1/redis_get?domain=flying-squirrel
```
