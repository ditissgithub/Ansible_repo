#!/bin/bash
sed "s/tagVersion/$1/g" higher_object.yaml  > Ansible_repo-Example_application-pod.yaml
