#!/bin/bash
# Stop Apache2 if running
if pgrep apache2 > /dev/null; then
    sudo systemctl stop apache2
fi

# Stop Tomcat9 if running
if pgrep tomcat9 > /dev/null; then
    sudo systemctl stop tomcat9
fi
