## Simple Streams LXD Image Server
#### NOTICE: Container built with hard-coded host/domain/tld & IP configs for [CCIO Mini-Stack](https://github.com/containercraft/mini-stack)    

#### Create the Container Profile
```sh
wget -O- https://gitlab.com/kat.morgan/simple-streams-mirror-build/raw/master/lxd/aux/bin/profile-build-lxd-simple-streams.sh | bash
```
#### Create the Container
```sh
lxc launch ubuntu:bionic simple-streams -p simple-streams
lxc exec simple-streams -- tail -f /var/log/cloud-init-output.log
```

#### Sync Images:
```sh
```

## Configure LXD Client:
#### Import Certificate
```sh
mkdir /usr/local/share/ca-certificates/proxy
wget -P /usr/local/share/ca-certificates/proxy/ http://10.10.0.52:8080/squid-ca.crt
chmod 644 /usr/local/share/ca-certificates/proxy/squid-ca.crt
update-ca-certificates
```
#### Import Mirror
```sh
```
#### Launch Image
```sh
```
