#!/bin/bash

#--disk path=/data/gluster/${NAME}_storage.img,bus=virtio,size=100 \
#--extra-args 'console=ttyS0,115200n8 serial' \
NAME=gluster01

virt-install \
-n $NAME \
--description $NAME \
--os-type=Linux \
--os-variant=rhel7 \
--ram=8192 \
--vcpus=2 \
--graphics none \
--disk path=/data/gluster/${NAME}_root.img,bus=virtio,size=10 \
--disk path=/data/gluster/${NAME}_storage.img,bus=virtio,size=200 \
--location '/images/rhel-server-7.5-x86_64-dvd.iso' \
--extra-args 'console=ttyS0,115200n8 serial' \
--mac=52:54:00:91:1a:d8 
