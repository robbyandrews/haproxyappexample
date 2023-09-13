#!/bin/bash
add_domain () {
echo "Domain is not set in .env, please enter your domain: "
read DOMAIN
}
export $(cat .env | xargs)

if [ -n "$DOMAIN" ]
then 
echo $DOMAIN
else 
add_domain
fi
