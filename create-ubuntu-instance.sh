#!/bin/bash

# Create a new Ubuntu instance on AWS
aws ec2 run-instances --image-id <image-id> --count 1 --instance-type <instance-type> --key-name <key-name> --security-groups <security-group-name>

# Get the instance ID of the newly created instance
instance_id=$(aws ec2 describe-instances --query "Reservations[*].Instances[*].InstanceId" --output text)

# Wait for the instance to be in the "running" state
aws ec2 wait instance-running --instance-ids $instance_id

# Get the public IP address of the instance
public_ip=$(aws ec2 describe-instances --instance-ids $instance_id --query "Reservations[*].Instances[*].PublicIpAddress" --output text)

# Connect to the instance using SSH
ssh -i <key-file-path> ubuntu@$public_ip
