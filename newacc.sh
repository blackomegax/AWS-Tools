#!/bin/bash

# Create a new AWS account
aws configure
aws create-account --email <email-address> --account-name <account-name>

# Set up access keys for the new AWS account
aws configure set aws_access_key_id <access-key-id>
aws configure set aws_secret_access_key <secret-access-key>

# Save the new AWS account details in a file
echo "AWS_ACCOUNT_NAME=<account-name>" >> ~/.aws/config
echo "AWS_ACCESS_KEY_ID=<access-key-id>" >> ~/.aws/config
echo "AWS_SECRET_ACCESS_KEY=<secret-access-key>" >> ~/.aws/config

# Set the default region for the new AWS account
aws configure set default.region <region>
