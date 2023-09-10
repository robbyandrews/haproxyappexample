sudo mkdir -p /etc/haproxy/certs
sudo sh -c  'cat /etc/letsencrypt/live/www.yourdomain.com/fullchain.pem /etc/letsencrypt/live/www.yourdomain.com/privkey.pem > /etc/haproxy/certs/yourdomain.com.pem'