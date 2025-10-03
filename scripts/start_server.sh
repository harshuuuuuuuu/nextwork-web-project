#!/bin/bash
# Update system
sudo apt-get update -y

# Install Tomcat9 and Apache2
sudo apt-get install -y tomcat9 tomcat9-admin apache2

# Enable proxy modules for Apache
sudo a2enmod proxy proxy_http rewrite headers

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

# Enable the new site and restart services
sudo a2ensite tomcat_manager.conf
sudo systemctl restart apache2
sudo systemctl restart tomcat9

# Enable services to start on boot
sudo systemctl enable apache2
sudo systemctl enable tomcat9
