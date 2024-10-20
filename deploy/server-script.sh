#!/bin/bash
yum update -y
yum install -y python3 python3-pip git

# Clone the GitHub repository
git clone https://github.com/vov62/PokeApi-Project-Python-AWS-DynamoaDB-Terraform /home/ec2-user/app

# Install Python dependencies
cd /home/ec2-user/app
pip3 install -r requirements.txt
pip3 install boto3

# Export the table name to a file from Terraform outputs
echo "$(terraform output -raw tableid)" > /home/ec2-user/app/terraform_output.txt

# Run the application in the background
nohup python3 poke_task.py --draw yes &  

