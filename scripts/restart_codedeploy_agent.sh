#!/bin/bash
# Restart CodeDeploy agent on Ubuntu
sudo systemctl stop codedeploy-agent
sudo systemctl start codedeploy-agent
sudo systemctl enable codedeploy-agent
sudo systemctl status codedeploy-agent
