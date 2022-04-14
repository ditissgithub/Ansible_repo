#!/bin/bash
sed "s/tagVersion/$1/g"  > Ansible_repo-Example_application-pod.yaml
