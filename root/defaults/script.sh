#!/bin/bash

# set variables
unset FOLDER_DATE FOLDER_MAKE REPO_USER
FOLDER_DATE=$(date '+%d-%b-%Y')
FOLDER_MAKE="/backup/${FOLDER_DATE}"
REPO_USER=""

# delete folders older than 20 days
for i in $(find /backup/ -maxdepth 1 -type d -mtime +20 -print); do echo -e "Deleting directory $i";rm -rf $i; done

# make today's folder
if [ -d "${FOLDER_MAKE}" ]; then
rm -rf "${FOLDER_MAKE}"
fi
mkdir -p "${FOLDER_MAKE}" && touch "${FOLDER_MAKE}"

# clone git repositories into todays folder
cd "${FOLDER_MAKE}"
curl -s "https://api.github.com/users/${REPO_USER}/repos?per_page=200" | python -c $'import json, sys, os\nfor repo in json.load(sys.stdin): os.system("git clone " + repo["clone_url"])'

# permissions
chown -R abc:abc "${FOLDER_MAKE}"
