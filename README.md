# gluster
Setting up Gluster

Docs

https://access.redhat.com/documentation/en-us/red_hat_gluster_storage/

https://access.redhat.com/articles/2352211

Set up a bridged network on your host:

https://help.ubuntu.com/community/KVM/Networking

Run the bin/gluster*.sh to set up the VMs. Your paths may differ.

Copy over SSH keys

###Setup LVM stuff on second, empty virtual disk

1. pvcreate /dev/vdb
2. vgcreate -s 32M bricks /dev/vdb
3. lvcreate -L 99G --thinpool thin-pool bricks

###Distributed Volume 

On each node : 

4. lvcreate -V 99G -T bricks/thin-pool -n brick1
5. mkfs.xfs -i size=512 /dev/bricks/brick1
6. mkdir -p /bricks/brick1
7. to /etc/fstab add : "/dev/bricks/brick1  /bricks/brick1    xfs   rw,noatime,inode64,nouuid   1   2"
8. mount -a
9. mkdir /bricks/brick1/brick

Create a gluster distributed volume :
```
gluster volume create dist-vol \
gluster01:/bricks/brick1/brick \
gluster02:/bricks/brick1/brick \
gluster03:/bricks/brick1/brick
```

###Replicated Volume 

On each node : 

4. lvcreate -V 99G -T bricks/thin-pool -n brick2
5. mkfs.xfs -i size=512 /dev/bricks/brick2
6. mkdir -p /bricks/brick2
7. to /etc/fstab add : "/dev/bricks/brick2  /bricks/brick2    xfs   rw,noatime,inode64,nouuid   1   2"
8. mount -a
9. mkdir /bricks/brick2/brick

Create a gluster replicated volume :
```
gluster volume create dist-vol \
gluster01:/bricks/brick1/brick \
gluster02:/bricks/brick1/brick \
gluster03:/bricks/brick1/brick
```