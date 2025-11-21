### chmod +x assume_role.sh
### ./assume_role.sh arn:aws:iam::123456789012:role/MyAssumedRole MySession

#!/bin/bash

# Check for required arguments
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <ROLE_ARN> <SESSION_NAME>"
    exit 1
fi

ROLE_ARN=$1
SESSION_NAME=$2

# Assume the role and get temporary credentials
ASSUMED_ROLE_OUTPUT=$(aws sts assume-role \
    --role-arn "$ROLE_ARN" \
    --role-session-name "$SESSION_NAME" \
    --query 'Credentials' \
    --output json)

# Extract credentials and set environment variables
export AWS_ACCESS_KEY_ID=$(echo "$ASSUMED_ROLE_OUTPUT" | jq -r '.AccessKeyId')
export AWS_SECRET_ACCESS_KEY=$(echo "$ASSUMED_ROLE_OUTPUT" | jq -r '.SecretAccessKey')
export AWS_SESSION_TOKEN=$(echo "$ASSUMED_ROLE_OUTPUT" | jq -r '.SessionToken')

echo "Assumed role: $ROLE_ARN with session name $SESSION_NAME"
echo "Temporary credentials exported to environment variables."
