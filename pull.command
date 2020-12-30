#! /bin/bash

# Set current working directory to script directory
cd "${0%/*}"

# Set AWS environment variables
export $(grep -v '^#' .env | xargs)

# Pull git repository
echo -e "${YELLOW}\nPulling site...${NOCOLOR}"
git pull origin master --no-edit

# Sync images with AWS
echo -e "${YELLOW}\nPulling images...${NOCOLOR}"
aws s3 sync s3://ashtari-carpets-sfeer static/images/ --exclude ".*" --size-only

# Update Hugo theme
echo -e "${YELLOW}\nUpdating Hugo theme...${NOCOLOR}"
hugo mod get -u

# Done
echo -e "${GREEN}\nDone. Everything is up to date on this computer.${NOCOLOR}"
echo -e "${GREEN}You can close this window.\n${NOCOLOR}"
