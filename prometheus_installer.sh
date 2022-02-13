#!/bin/bash

# Create user
sudo groupadd --system prometheus
sudo useradd -s /sbin/nologin --system -g prometheus prometheus

#Create directories
sudo rm -R /var/lib/prometheus
sudo mkdir -p /var/lib/prometheus
sudo rm -R /tmp/prometheus/scripts_git
sudo mkdir -p /tmp/prometheus/scripts_git
for i in rules rules.d files_sd; do sudo mkdir -p /etc/prometheus/${i}; done

#Gather required files
cd /tmp/prometheus/scripts_git
sudo git clone https://github.com/Meekow/Fin_assignment.git
cd /tmp/prometheus && sudo curl -s https://api.github.com/repos/prometheus/prometheus/releases/latest | grep browser_download_url | grep linux-amd64 | cut -d '"' -f 4 | wget -qi -

# Unpack files 
tar xvf prometheus-2.33.3.linux-amd64.tar.gz

# Move files to appropriate location
cd /tmp/prometheus/prometheus-2.33.3.linux-amd64
sudo mv prometheus promtool /usr/local/bin/
sudo mv consoles/ console_libraries/ /etc/prometheus/
cd /tmp/prometheus/scripts_git/Fin_assignment
sudo mv prometheus.service /etc/systemd/system/prometheus.service
sudo mv prometheus.yml  /etc/prometheus/prometheus.yml

#Allocate rights
for i in rules rules.d files_sd; do sudo chown -R prometheus:prometheus /etc/prometheus/${i}; done
for i in rules rules.d files_sd; do sudo chmod -R 775 /etc/prometheus/${i}; done
sudo chown -R prometheus:prometheus /var/lib/prometheus/

#starting
sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl enable prometheus
sudo systemctl status prometheus

#Housekeeping
cd /
sudo rm -rf /tmp/prometheus
