#!/bin/bash

# Find all the .xml files in the directory and subdirectories
FILES=$(find . -type f -name "*.xml")

for FILE in $FILES; do
  # Get the current version from the file
  CURRENT_VERSION=$(xmlstarlet sel -t -v "/project/version" $FILE)

  # Increment the minor version number
  NEW_VERSION=$(echo $CURRENT_VERSION | awk -F"." '{print $1"."$2+1".0"}')

  # Replace the version with the new version
  sed -i "s/${CURRENT_VERSION}/${NEW_VERSION}/g" $FILE
done
