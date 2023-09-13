#!/bin/bash
add_domain (){
echo "Domain not set, enter your domain: "
read DOMAIN
}

add_email (){
echo "Email not set, enter your email"
read EMAIL
}
export $(cat .env | xargs)
if [ -n "$DOMAIN" ]
then 
echo "Using $DOMAIN for the domain"
else 
add_domain
fi

if [ -n "$EMAIL" ]
then 
echo "Using $EMAIL for the email address"
else 
add_email
fi


sudo apt-get install -y certbot
sudo certbot certonly --manual --preferred-challenges dns --email $EMAIL -d www.$DOMAIN -d $DOMAIN