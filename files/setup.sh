#!/bin/sh
# Initial setup script - gets us ansible 1.7 in trusty

set -e

apt-get update
apt-get install -y python-setuptools software-properties-common
apt-add-repository -y 
apt-get install -y ansible python-setuptools patch

# Upgrade base packages
apt-get -y upgrade
apt-get -y dist-upgrade

easy_install -U pip

pip install boto
pip install requests

mv /tmp/packer_files/hosts /etc/ansible/hosts
chmod +x /etc/ansible/hosts

mv /tmp/packer_files/ansible.conf /etc/init/ansible.conf

mv /tmp/packer_files/make_dockercfg /usr/sbin/make_dockercfg
chmod +x /usr/sbin/make_dockercfg

mkdir -p /etc/empire
mv /tmp/ansible /etc/empire/ansible
