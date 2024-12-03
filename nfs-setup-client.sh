#!/bin/bash
nfs_server_ip="10.52.1.86"
apt update
apt install nfs-common -y
firewall-cmd --zone=trusted --add-source=10.0.0.0/8
firewall-cmd --runtime-to-permanent
firewall-cmd --reload
mkdir -p -m 770 /shared
chmod 770 /shared
chown -R cc:cc /shared
mount -t nfs -o nfsvers=4.2,proto=tcp $nfs_server_ip:/exports/nfs /shared
echo "$nfs_server_ip:/exports/nfs /shared    nfs" >> /etc/fstab
mount -a
