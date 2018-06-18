#!/bin/bash

NAME=ocpcluster01

virt-install \
-n $NAME \
--description $NAME \
--os-type=Linux \
--os-variant=rhel7 \
--ram=16384 \
--vcpus=2 \
--graphics none \
--disk path=/data/gluster/${NAME}_root.img,bus=virtio,size=20 \
--disk path=/data/gluster/${NAME}_docker_storage.img,bus=virtio,size=50 \
--disk path=/data/gluster/${NAME}_gluster_storage.img,bus=virtio,size=50 \
--location '/images/rhel-server-7.5-x86_64-dvd.iso' \
--extra-args 'console=ttyS0,115200n8 serial' \
--mac=52:54:00:91:6a:d8
