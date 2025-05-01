#!/bin/bash

# Define project directory
projectDir="config/packages"

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

# chmod +x composer.phar

php composer.phar dump-env prod 
php composer.phar install --no-dev --optimize-autoloader
php composer.phar dump-autoload --no-dev --classmap-authoritative
php bin/console cache:clear
php bin/console cache:clear --env=prod

