#!/bin/bash

TERM=dumb ANSIBLE_FORCE_COLOR=true ansible-playbook -u $USER -k -K all.yaml
