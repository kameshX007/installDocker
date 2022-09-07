#!/bin/sh
#Installing prerequisite
echo "Installing prerequisite...">installDocker.log;
apt -y update;
apt-get -y install ca-certificates curl gnupg lsb-release;
mkdir -p /etc/apt/keyrings;
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg;
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null;

#Installing Docker
echo "Installing Docker...">installDocker.log;
apt -y update;
apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose docker-compose-plugin

echo "Docker installed successfully...">>installDocker.log;
exit 0