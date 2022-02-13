#!/bin/bash

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
#Prometheus installer
sudo ./prometheus_installer.sh

#Exporters
#Grok-Expansion installer (enables Prometheus to pull logs from the managed server) 
sudo ./grok-exp_install.sh


#check for updates and implement them
sudo apt-get -y upgrade