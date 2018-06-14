#!/usr/bin/env bash

rm -rf ../ansible/*.retry

ansible-playbook  -vv -i ../ansible/inventory ../ansible/ocp_install_scripts.yml
