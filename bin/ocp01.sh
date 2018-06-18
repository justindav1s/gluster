#!/bin/bash

NAME=ocp01

virt-install \
-n $NAME \
--description $NAME \
--os-type=Linux \
--os-variant=rhel7 \
--ram=32768 \
--vcpus=4 \
--graphics none \
--disk path=/data/gluster/${NAME}_root.img,bus=virtio,size=50 \
--disk path=/data/gluster/${NAME}_docker_storage.img,bus=virtio,size=100 \
--location '/images/rhel-server-7.5-x86_64-dvd.iso' \
--extra-args 'console=ttyS0,115200n8 serial' \
--mac=52:54:00:91:6a:d8
