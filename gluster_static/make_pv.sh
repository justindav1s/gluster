#!/usr/bin/env bash

. ../bin/env.sh

oc login https://${IP}:8443 -u $USER

oc project $PROJECT

oc create -f gluster-pv.yml
