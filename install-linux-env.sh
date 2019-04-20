#!/bin/bash

printf -- 'Downloading apt packages\n';
sudo apt install -y ipython ipython3 python3 vim cmake scons wget curl g++ gcc zsh rustc;

printf -- 'Installing oh-my-zsh\n';
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";

if hash dotnet>/dev/null; then 
    printf -- 'Dotnet installed skipping\n';
else
    printf -- 'Installing Dotnet\n';
    wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
    sudo dpkg -i packages-microsoft-prod.deb
    sudo add-apt-repository universe
    sudo apt-get install apt-transport-https
    sudo apt-get update
    sudo apt-get install dotnet-sdk-2.2
    rm packages-microsoft-prod.deb
fi
