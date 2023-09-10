#!/bin/bash
echo "Enter your domain: "
read domain
sudo mkdir -p /etc/haproxy/certs
sudo sh -c  "cat /etc/letsencrypt/live/www.$domain/fullchain.pem /etc/letsencrypt/live/www.$domain/privkey.pem > /etc/haproxy/certs/$domain.pem"