#!/bin/bash

#Uninstaller to clean up current/previous instances. 

# Uninstall prometheus
sudo deluser prometheus

sudo rm -rf /etc/prometheus
sudo rm -rf /var/lib/prometheus
sudo rm -rf /tmp/prometheus
sudo rm -rf /usr/local/go
sudo rm -rf 

sudo rm /usr/local/bin/prometheus
sudo rm /usr/local/bin/promtool

sudo rm /etc/systemd/system/prometheus.service

sudo apt purge nginx
sudo apt purge build-essential
sudo apt purge libonig-dev


sudo systemctl daemon-reload
