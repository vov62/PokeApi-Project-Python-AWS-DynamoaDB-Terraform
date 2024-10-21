#!/bin/bash

# Update the instance 
yum update -y
yum install -y python3 python3-pip git

# Clone the GitHub repository
git clone https://github.com/vov62/PokeApi-Project-Python-AWS-DynamoaDB-Terraform /home/ec2-user/app

cd /home/ec2-user/app

# Install Python dependencies
pip3 install -r requirements.txt
pip3 install boto3 requests

# Ensure that the correct version of Python is used and that the environment is ready
which python3
python3 --version
pip3 --version

echo "$(terraform output -raw tableid)" > /home/ec2-user/app/terraform_output.txt


# Run the application in the background
nohup python3 main.py --draw yes &  

