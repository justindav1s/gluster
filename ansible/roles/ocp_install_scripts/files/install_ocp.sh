#!/usr/bin/env bash

ansible-playbook -i hosts.with.gluster \
   /usr/share/ansible/openshift-ansible/playbooks/deploy_cluster.yml