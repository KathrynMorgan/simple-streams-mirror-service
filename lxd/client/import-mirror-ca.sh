mkdir /usr/share/ca-certificates/images/
wget https://lxd.images.mini-stack.maas/ca/proxy-root-ca.crt -O /usr/share/ca-certificates/proxy/images-root-ca.crt
dpkg-reconfigure ca-certificates
update-ca-certificates
