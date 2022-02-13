#!/bin/bash

#Allocate execute priviledges. 

#Install dependencies

# Nginx installer
sudo chmod +x nginx_install.sh
sudo ./nginx_install.sh
#Go lang installation
sudo chmod +x Go_install.sh
sudo ./Go_install.sh
#GCC installation (req for cgo)
sudo chmod +x build-essential
sudo apt-get install build-essential
#Oniguruma library install (required for Grok)
sudo chmod +x libonig-dev
sudo apt-get install libonig-dev

# Install main
#Prometheus installer
sudo chmod +x prometheus_installer.sh
sudo ./prometheus_installer.sh

#Exporters
sudo chmod +x grok-exp_install.sh
#Grok-Expansion installer (enables Prometheus to pull logs from the managed server) 
sudo ./grok-exp_install.sh


#check for updates and implement them
sudo apt-get -y upgrade