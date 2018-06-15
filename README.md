# Setting up Gluster

### Setup VM's

Set up a bridged network on your host:

https://help.ubuntu.com/community/KVM/Networking

Run the bin/gluster*.sh to set up the VMs. Your paths may differ.

Copy over SSH keys


### Gluster Docs

https://access.redhat.com/documentation/en-us/red_hat_gluster_storage/

https://access.redhat.com/articles/2352211

### Openshift Gluster Docs

https://docs.openshift.com/container-platform/3.9/install_config/persistent_storage/persistent_storage_glusterfs.html


### Setup LVM stuff on second, empty virtual disk

1. pvcreate /dev/vdb
2. vgcreate -s 32M bricks /dev/vdb
3. lvcreate -L 99G --thinpool thin-pool bricks

### Distributed Volume 

On each node : 

1. lvcreate -V 99G -T bricks/thin-pool -n brick1
2. mkfs.xfs -i size=512 /dev/bricks/brick1
3. mkdir -p /bricks/brick1
4. to /etc/fstab add : "/dev/bricks/brick1  /bricks/brick1    xfs   rw,noatime,inode64,nouuid   1   2"
5. mount -a
6. mkdir /bricks/brick1/brick
7. Create a gluster distributed volume :
```
gluster volume create dist-vol \
gluster01:/bricks/brick1/brick \
gluster02:/bricks/brick1/brick \
gluster03:/bricks/brick1/brick
```
8. gluster volume start dist-vol
9. gluster volume info dist-vol

### Replicated Volume 

On each node : 

1. lvcreate -V 99G -T bricks/thin-pool -n brick2
2. mkfs.xfs -i size=512 /dev/bricks/brick2
3. mkdir -p /bricks/brick2
4. to /etc/fstab add : "/dev/bricks/brick2  /bricks/brick2    xfs   rw,noatime,inode64,nouuid   1   2"
5. mount -a
6. mkdir /bricks/brick2/brick
7. Create a gluster replicated volume :
```
gluster volume create rep-vol replica 3 \
gluster01:/bricks/brick2/brick \
gluster02:/bricks/brick2/brick \
gluster03:/bricks/brick2/brick
```
8. gluster volume start rep-vol
9. gluster volume info rep-vol 



docker pull rhgs3/rhgs-volmanager-rhel7:latest