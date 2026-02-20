#!/bin/bash

TERM=dumb ANSIBLE_FORCE_COLOR=true ansible-playbook -u $USER -k -K install_and_configure_all.yaml
