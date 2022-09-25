#!/bin/bash
getUserName(){
    echo "Please enter the username";
    echo "We will create a docker folder inside this users home directory to store the docker persistant volume"

    read x;
    if [ -z $x ]
    then
        echo "No Username entered, defaulting to ubuntu" && dockerUser="ubuntu";
    else
        dockerUser=$x;
    fi
}
#Installing prerequisite
echo "Installing prerequisite...";
sudo sh installPrerequisite.sh;

#Installing Docker
echo "Installing Docker...";
sudo sh installComponents.sh;
echo "Docker installed successfully...";

#Adding docker to the user group
echo "Adding docker to the user group...";
getUserName;
sudo usermod -aG docker $dockerUser;
#Creating a network for docker on whcoh all containers will get deployed
echo "Creating a network for docker on whcoh all containers will get deployed...";
sudo docker network create tunnel;
echo "tunnel network created...";
echo "System needs to reboot to take changes effect.Enter y to rebbot now else the futher flow wont work!!!";
if [[ "$x" == "y" || "$x" == "Y" ]]
then
    sudo reboot;
else
    exit 0;
fi
exit 0