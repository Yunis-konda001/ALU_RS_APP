#!/bin/bash

# Define the remote server details
REMOTE_USER="8729988b1034"
REMOTE_HOST="8729988b1034.7b3ea1d9.alu-cod.online"
REMOTE_DIR="/summative/0524-2024m"
LOCAL_DIR="negpod_2-q1"
PASSWORD="24f83e4c3589e7ab7ed3"

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

