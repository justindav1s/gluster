#!/usr/bin/env bash

rm -rf ../ansible/*.retry

ansible-playbook  -vv -i ../ansible/inventory ../ansible/setup_all_nodes.yml
