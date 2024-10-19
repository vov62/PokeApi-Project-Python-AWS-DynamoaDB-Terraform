#!/bin/bash
yum update -y
yum install -y python3 python3-pip git

# Clone the GitHub repository
git clone https://github.com/vov62/PokeApi-Project-Python-AWS-Terraform /home/ec2-user/app

# Navigate to the app directory
cd /home/ec2-user/app

# Install Python dependencies (if applicable)
if [ -f requirements.txt ]; then
    pip3 install -r requirements.txt
    fi

pip3 install boto3

# Run the application in the background
nohup python3 poke_task.py --draw yes &  