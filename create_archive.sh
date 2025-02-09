#!/bin/bash

# Prompt the user for the directory or file to archive
read -p "Enter the directory or file to archive: " input_path

# Check if the input path exists
if [ ! -e "$input_path" ]; then
  echo "The specified path does not exist."
  exit 1
fi

# Prompt the user for the type of archive
read -p "Enter the type of archive (tar/zip): " archive_type

# Create the archive based on the user's choice
case $archive_type in
  tar)
    tar -czvf archive.tar.gz "$input_path"
    gpg --symmetric --cipher-algo aes256 archive.tar.gz
    echo "Created archive.tar.gz.gpg"
    ;;
  zip)
    read -sp "Enter the password: " password
    echo
    zip -r -e archive.zip "$input_path" --password "$password"
    echo "Created archive.zip"
    ;;
  *)
    echo "Invalid archive type. Please enter 'tar' or 'zip'."
    exit 1
    ;;
esac
