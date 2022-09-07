#!/bin/bash

SESSION_NAME="${AWS_SESSION_NAME:-$(date +%s)}"
DURATION="${AWS_ROLE_DURATION:-3600}"

# Generate role keys and save the json to $output
output="/tmp/role-keys.json"
aws sts assume-role --role-arn "arn:aws:iam::$AWS_ACCOUNT_ID:role/$AWS_ROLE" \
                          --role-session-name "$SESSION_NAME" \
                          --duration-seconds "$DURATION" > $output

# Use `jq` to pick out the keys we need to export as environment variables
ACCESS_KEY_ID=$(cat $output | jq -r '.Credentials''.AccessKeyId')
SECRET_ACCESS_KEY=$(cat $output | jq -r '.Credentials''.SecretAccessKey')
SESSION_TOKEN=$(cat $output | jq -r '.Credentials''.SessionToken')

# Delete role keys json file
rm -rf $output

# Set AWS env vars so future cli commands will use the assumed role
export AWS_ACCESS_KEY_ID=${ACCESS_KEY_ID}
export AWS_SECRET_ACCESS_KEY=${SECRET_ACCESS_KEY}
export AWS_SESSION_TOKEN=${SESSION_TOKEN}
export AWS_SECURITY_TOKEN=${SESSION_TOKEN}
