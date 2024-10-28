#!/bin/bash

yum update -y
yum install -y python3 python3-pip git

# create directory for entering aws credentials
cd /home/ec2-user
mkdir -p /home/ec2-user/.aws
cd .aws/
touch credentials
sudo chmod 777 credentials
touch config
cd ..

git clone https://github.com/vov62/PokeApi-Project-Python-AWS-DynamoaDB-Terraform /home/ec2-user/app

cd /home/ec2-user/app

# Install Python dependencies
pip3 install -r requirements.txt
pip3 install boto3 requests

nohup python3 main.py --draw yes &  