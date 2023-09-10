#!/bin/bash
echo "Enter your email: "
read email
echo "Enter your domain: "
read domain
sudo apt-get install -y certbot
sudo certbot certonly --manual --preferred-challenges dns --email $email -d www.$domain -d $domain