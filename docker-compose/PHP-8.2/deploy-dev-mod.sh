#!/bin/bash

# Define project directory
projectDir="APP_DIR_NAME/config/packages"

# Find the YAML file
yamlFile=$(find "$projectDir" -name 'framework.yaml' -type f)

# Get the current version
currentVersion=$(grep -Po '(?<=version: ver=)[0-9.]+' "$yamlFile")

# Increment the minor version
IFS='.' read -r -a versionParts <<< "$currentVersion"
((versionParts[1]++))

# Construct the new version
newVersion="${versionParts[0]}.${versionParts[1]}"

# Update the version in the YAML file
sed -i "s/version: ver=$currentVersion/version: ver=$newVersion/" "$yamlFile"

docker-compose exec -T web sh -c " 
cd APP_DIR_NAME
php composer.phar dump-env dev
php composer.phar update
php composer.phar install
php bin/console cache:clear
php bin/console cache:clear --env=dev
"