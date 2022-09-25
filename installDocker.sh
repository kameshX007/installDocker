#!/bin/sh
#Installing prerequisite
echo "Installing prerequisite...">installDocker.log;
sudo sh installPrerequisite.sh;

#Installing Docker
echo "Installing Docker...">installDocker.log;
sudo sh installComponents.sh;
echo "Docker installed successfully...">>installDocker.log;
exit 0