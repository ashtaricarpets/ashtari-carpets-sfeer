#! /bin/bash

# Set AWS environment variables
export $(grep -v '^#' .env | xargs)

# Sync images with AWS
echo -e "${YELLOW}\nPulling images...${NOCOLOR}"
aws s3 sync s3://ashtari-carpets-sfeer static/images/ --exclude ".*"


