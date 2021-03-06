#!/bin/bash
. .color_codes

if [ "$USER" != "root" ];then
    echo -e "${Red}need to run with sudo!${Color_Off}"
fi

apt-get remove -y docker docker-engine docker.io containerd runc;
apt-get update -y;
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common ;
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - ;
apt-key fingerprint 0EBFCD88 ;
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" ;\
apt-get update -y ;
apt-get install -y docker-ce docker-ce-cli containerd.io;
