#!/bin/bash
set -euo pipefail

sudo apt update

sudo apt install -y apache2 socat
sudo sed -i 's/Listen 80/Listen 10000/' /etc/apache2/ports.conf
sudo sed -i 's/<VirtualHost \*:80>/<VirtualHost *:10000>/' /etc/apache2/sites-enabled/000-default.conf
sudo systemctl restart apache2

sudo iptables -A INPUT -p tcp --dport 10000 ! -s 127.0.0.1 -j DROP

sudo cp index.html /var/www/html/
sudo cp error.html /var/www/html/
sudo cp proxyServer.sh /etc/proxyServer.sh
sudo chmod +x /etc/proxyServer.sh
sudo cp proxyServer.service /etc/systemd/system/proxyServer.service

sudo systemctl daemon-reload
sudo systemctl enable proxyServer.service
sudo systemctl restart proxyServer.service