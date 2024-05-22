#!/bin/bash
sudo su
apt-get update -y
apt-get install apache2 -y
systemctl enable apache2
systemctl start apache2
echo " <H1> Azure Linux VM using terraform </H1> " | tee /var/www/html/index.html
