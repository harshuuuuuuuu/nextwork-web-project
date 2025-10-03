#!/bin/bash
# Stop Apache2 if running
isExistApp="$(pgrep apache2)"
if [[ -n $isExistApp ]]; then
  sudo systemctl stop apache2
fi

# Stop Tomcat if running
isExistApp="$(pgrep tomcat)"
if [[ -n $isExistApp ]]; then
  sudo systemctl stop tomcat
fi
