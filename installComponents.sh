#!/bin/sh
#Installing Docker
apt -y update;
apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose docker-compose-plugin;
exit 0