#!/bin/bash

# Update the instance 
yum update -y
yum install -y python3 python3-pip git unzip

# Install Terraform
TERRAFORM_VERSION="1.9.7"  
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
mv terraform /usr/local/bin/
chmod +x /usr/local/bin/terraform

# Clone the GitHub repository
git clone https://github.com/vov62/PokeApi-Project-Python-AWS-DynamoaDB-Terraform /home/ec2-user/app

cd /home/ec2-user/app

# Install Python dependencies
pip3 install -r requirements.txt
pip3 install boto3 requests

# Set the DynamoDB table name as an environment variable
export DYNAMODB_TABLE_NAME="$(terraform output -raw tableid)"



# Ensure that the correct version of Python is used and that the environment is ready
which python3
python3 --version
pip3 --version

# Run the application in the background
nohup python3 main.py --draw yes &  