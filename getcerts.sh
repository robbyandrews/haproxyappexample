#!/bin/bash
sudo apt-get install -y certbot
sudo certbot certonly --manual --preferred-challenges dns --email your-email -d www.your-domain.com -d your-domain.com