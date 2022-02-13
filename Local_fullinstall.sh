#!/bin/bash

#Allocate execute priviledges. 

sudo chmod +x build-essential
sudo chmod +x libonig-dev
sudo chmod +x prometheus_installer.sh
sudo chmod +x grok-exp_install.sh
sudo chmod +x nginx_install.sh
sudo chmod +x go_install.sh

#Install dependencies
# Nginx installer
sudo ./nginx_install.sh
#Go lang installation
sudo ./go_install.sh
#GCC installation (req for cgo)
sudo apt-get install build-essential
#Oniguruma library install (required for Grok)
sudo apt-get install libonig-dev

# Install main
cd /tmp/prometheus
sudo git clone https://github.com/Meekow/Melano-428180_ITV2I_LINUX-FIN.git
#Prometheus installer
sudo ./prometheus_installer.sh

#Exporters
#Grok-Expansion installer (enables Prometheus to pull logs from the managed server) 
sudo ./grok-exp_install.sh


#check for updates and implement them
sudo apt-get -y upgrade