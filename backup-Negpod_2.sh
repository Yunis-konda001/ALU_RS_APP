#!/bin/bash

# Remote server details
HOST="ec1ebc754f75.a5efec7a.alu-cod.online"
USERNAME="ec1ebc754f75"
PASSWORD="ea1d8f222b11d7be18f6"
BACKUP_DIR="/summative/0524-2024m"

# Directory to backup
LOCAL_DIR="negpod_id-q1"

# Create backup using rsync
rsync -avz -e "sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=no" $LOCAL_DIR $USERNAME@$HOST:$BACKUP_DIR
