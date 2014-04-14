tentacles
=========

Distributed HTTP proxy using Openresty with configuration data inside Redis.

Install Redis:

```
sudo add-apt-repository ppa:chris-lea/redis-server
sudo apt-get update
sudo apt-get install -y redis
```

Install Openresty:

```
sudo apt-get install -y libgd2-noxpm libssl0.9.8
sudo echo "deb     http://dl.bintray.com/octohost/openresty /" > /etc/apt/sources.list.d/openresty.list
sudo apt-get update
sudo apt-get install openresty
sudo service nginx stop
```

Setup the config files:

```
cd /etc/nginx/
sudo wget https://raw.githubusercontent.com/octohost/octohost-cookbook/master/files/default/proxy.conf
sudo wget https://raw.githubusercontent.com/octohost/octohost-cookbook/master/files/default/upstream.conf
sudo wget https://raw.githubusercontent.com/octohost/octohost-cookbook/master/files/default/api.conf
cd /etc/default/
sudo wget https://raw.githubusercontent.com/octohost/octohost-cookbook/master/files/default/default-proxy
sudo mv default-proxy proxy
cd /etc/init.d/
sudo wget https://raw.githubusercontent.com/octohost/octohost-cookbook/master/files/default/proxy
sudo chmod 755 proxy
# Install SSL cert and key or comment out the SSL portions of upstream.conf
sudo service proxy start
```

The proxy service runs on port 80. The /get interface for nginx in api.conf runs on port 81.

The octohost/tentacles container should run on port 82.

To /get, /set and /del virtual hosts.


```
docker pull octohost/tentacles
docker run -d -e REDIS_URL=redis://interface.ip.address.here:6379 -p 82:5000 octohost/tentacles

root@octohost:# octo proxy:get dude.example.com
root@octohost:# octo proxy:set dude.example.com 12345
root@octohost:# octo proxy:get dude.example.com
127.0.0.1:12345
root@octohost:# octo proxy:rm dude.example.com
root@octohost:# octo proxy:get dude.example.com
root@octohost:#

curl http://127.0.0.1:82/set?domain=flying-squirrel.example.com&endpoint=127.0.0.1:12345
curl http://127.0.0.1:82/get?domain=flying-squirrel.example.com
curl http://127.0.0.1:82/del?domain=flying-squirrel.example.com
```

This has all been folded into [octohost](http://www.octohost.io). We are using the [Redis cookbook](https://github.com/darron/redis-cookbook) and the [Openresty cookbook](https://github.com/darron/openresty-cookbook) inside the [octohost cookbook](https://github.com/octohost/octohost-cookbook).

Huge thanks to [@alkema](https://github.com/alkema) who got it running.
