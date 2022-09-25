#!/bin/sh
getUserName(){
    echo "Please enter the username";
    echo "We will create a docker folder inside this users home directory to store the docker persistant volume"

    read x;
    if [ -z $x ]
    then
        echo "No Username entered, defaulting to ubuntu" && dockerUser = "ubuntu";
    else
        dockerUser = $x;
    fi
}
#Installing prerequisite
echo "Installing prerequisite...">installDocker.log;
sudo sh installPrerequisite.sh;

#Installing Docker
echo "Installing Docker...">installDocker.log;
sudo sh installComponents.sh;
echo "Docker installed successfully...">>installDocker.log;

#Adding docker to the user group
echo "Adding docker to the user group...">installDocker.log;
getUserName;
sudo usermod -aG docker $dockerUser;
#Creating a network for docker on whcoh all containers will get deployed
echo "Creating a network for docker on whcoh all containers will get deployed...">installDocker.log;
docker network create tunnel;
echo "tunnel network created...">installDocker.log;
exit 0