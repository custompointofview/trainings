#!/usr/bin/env bash
echo "==================================="
echo "==== Provision VM START ===="
echo "==================================="

# update in silence
sudo apt-get -y update
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# add locals to avoid "WARNING! Your environment specifies an invalid locale." notifications
sudo sh -c 'printf "LANGUAGE=\"en_US.UTF-8\"\nLC_ALL=\"en_US.UTF-8\"\n" >> /etc/default/locale'
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
sudo dpkg-reconfigure locales

# install docker & use Docker as a non-root user
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) stable"

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# install docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# install docker & docker compose autocompletion
curl -sSLo /etc/bash_completion.d/docker-compose https://raw.githubusercontent.com/docker/compose/$(docker-compose --version | awk 'NR==1{print $NF}')/contrib/completion/bash/docker-compose

# post installation
export USER_V=vagrant
sudo groupadd docker
sudo usermod -aG docker $USER_V
# sudo newgrp docker
# sudo chown "$USER_V":"$USER_V" /home/"$USER_V"/.docker -R
# sudo chmod g+rwx "/home/$USER_V/.docker" -R

echo "==================================="
echo "==== Provisioning Done! ===="
echo "==================================="
