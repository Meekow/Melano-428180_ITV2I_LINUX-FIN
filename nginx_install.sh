#!/bin/bash


#install Nginx
sudo apt install nginx

sudo systemctl daemon-reload
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx