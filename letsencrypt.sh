#!/bin/bash
# This function prompts for the domain variable to be entered
add_domain () {
echo "Domain is not set in .env, please enter your domain: "
read DOMAIN
}
# This command looks for a .env file and defines the variables contained in the .env file.
export $(cat .env | xargs)

# This statement says if the .env file is either not present or doesn't contain the $DOMAIN variable prompt for it to be entered. 
if [ -n "$DOMAIN" ]
then 
echo "Using $DOMAIN for the domain"
else 
add_domain
fi




# This command installs the certs from LetsEncrypt and adds them to HAProxy for use in the config file.
sudo mkdir -p /etc/haproxy/certs
sudo sh -c  "cat /etc/letsencrypt/live/www.$DOMAIN/fullchain.pem /etc/letsencrypt/live/www.$DOMAIN/privkey.pem > /etc/haproxy/certs/$DOMAIN.pem"