#! /bin/sh
apt-get clean
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get update --fix-missing
