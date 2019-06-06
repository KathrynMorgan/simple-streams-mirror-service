cat <<EOF >/tmp/ss-profile.yaml
config:
  user.user-data: |
    #cloud-config
    package_upgrade: true
    packages:
      - ubuntu-cloudimage-keyring
      - simplestreams
      - nginx
    runcmd:
      - [apt-get, autoremove, "-y"]
      - [cp, "-f", "/etc/skel/.bashrc", "/root/.bashrc"]
      - [wget, "-O", "/bin/sstreams-build", "https://gitlab.com/kat.morgan/simple-streams-mirror-build/raw/master/lxd/aux/bin/sstreams-setup"]
      - [chmod, "+x", "/bin/sstreams-build"]
      - [sstreams-build]
description: Default LXD Profile
devices:
  eth0:
    name: eth0
    nictype: macvlan
    parent: lan
    type: nic
  root:
    path: /
    pool: default
    type: disk
name: simple-streams
EOF

# Detect && Purge 'simple-streams' Profile
[[ $(lxc profile list | grep simple-streams ; echo $?) == 0  ]] || lxc profile delete simple-streams

# Create && Write Profile
lxc profile create simple-streams
lxc profile edit simple-streams < <(cat /tmp/ss-profile.yaml)
