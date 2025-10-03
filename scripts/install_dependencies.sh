#!/bin/bash
# Update package index
sudo apt-get update -y

# Install Tomcat9 and Apache
sudo apt-get install -y tomcat9 tomcat9-admin apache2

# Enable required Apache modules for proxying
sudo a2enmod proxy
sudo a2enmod proxy_http

# Configure Apache as reverse proxy to Tomcat
sudo bash -c 'cat << EOF > /etc/apache2/sites-available/tomcat_manager.conf
<VirtualHost *:80>
  ServerAdmin root@localhost
  ServerName app.nextwork.com
  ProxyRequests Off
  ProxyPreserveHost On
  ProxyPass / http://localhost:8080/nextwork-web-project/
  ProxyPassReverse / http://localhost:8080/nextwork-web-project/
</VirtualHost>
EOF'

# Enable the site and restart services
sudo a2ensite tomcat_manager.conf
sudo systemctl restart apache2
sudo systemctl restart tomcat9
sudo systemctl enable apache2
sudo systemctl enable tomcat9
