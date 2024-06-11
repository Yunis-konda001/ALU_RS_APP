#!/bin/bash

# Define the remote server details
REMOTE_USER="ec1ebc754f75"
REMOTE_HOST="ec1ebc754f75.a5efec7a.alu-cod.online"
REMOTE_DIR="/summative/0524-2024m"
LOCAL_DIR="negpod_2-q1"
PASSWORD="ea1d8f222b11d7be18f6"

# Check if the local directory exists
if [ ! -d "$LOCAL_DIR" ]; then
    echo "Local directory $LOCAL_DIR does not exist. Exiting."
    exit 1
fi

# Use sshpass with scp to copy the directory to the remote server
sshpass -p "$PASSWORD" scp -r $LOCAL_DIR ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}

# Check if the scp command was successful
if [ $? -eq 0 ]; then
    echo "Backup of $LOCAL_DIR to $REMOTE_HOST:$REMOTE_DIR successful."
else
    echo "Backup failed."
fi

