#!/bin/bash
add_domain () {
echo "Domain is not set in .env, please enter your domain: "
read DOMAIN
}
export $(cat .env | xargs)

if [ -n "$DOMAIN" ]
then 
echo "Using $DOMAIN for the domain"
else 
add_domain
fi





sudo mkdir -p /etc/haproxy/certs
sudo sh -c  "cat /etc/letsencrypt/live/www.$DOMAIN/fullchain.pem /etc/letsencrypt/live/www.$DOMAIN/privkey.pem > /etc/haproxy/certs/$DOMAIN.pem"