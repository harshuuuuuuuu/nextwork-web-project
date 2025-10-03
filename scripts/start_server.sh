#!/bin/bash
# Start and enable Tomcat
sudo systemctl start tomcat9
sudo systemctl enable tomcat9

# Start and enable Apache2
sudo systemctl start apache2
sudo systemctl enable apache2
