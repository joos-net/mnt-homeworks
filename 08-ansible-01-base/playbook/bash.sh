#!/bin/bash
#create docker
docker run -d --name centos7 pycontribs/centos:7 sleep 10000
docker run -d --name ubuntu pycontribs/ubuntu sleep 10000
docker run -d --name fedora pycontribs/fedora sleep 10000

#start ansible
ansible-playbook -i inventory/prod.yml site.yml --ask-vault-pass

#rm docker
docker rm -f centos7 ubuntu fedora
