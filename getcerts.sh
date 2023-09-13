#!/bin/bash
# This function prompts for the domain variable to be entered

add_domain (){
echo "Domain not set, enter your domain: "
read DOMAIN
}
# This function prompts for the email variable to be entered

add_email (){
echo "Email not set, enter your email"
read EMAIL
}

# This command looks for a .env file and defines the variables contained in the .env file.
export $(cat .env | xargs)

# This statement says if the .env file is either not present or doesn't contain the DOMAIN variable prompt for it to be entered. 

if [ -n "$DOMAIN" ]
then 
echo "Using $DOMAIN for the domain"
else 
add_domain
fi
# This statement says if the .env file is either not present or doesn't contain the EMAIL variable prompt for it to be entered. 

if [ -n "$EMAIL" ]
then 
echo "Using $EMAIL for the email address"
else 
add_email
fi

# These commands automate the install of certbot and create the certs needed for SSL termination
sudo apt-get install -y certbot
sudo certbot certonly --manual --preferred-challenges dns --email $EMAIL -d www.$DOMAIN -d $DOMAIN