#!/bin/bash
sed "s/tagVersion/$1/g" higher_object.yaml  > application-pod.yaml
