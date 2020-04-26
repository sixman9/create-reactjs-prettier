#!/bin/bash

defaultName=my-pretty-app
defaultDir=~/reactProjects

# Get user's chosen app name
read -p "Enter your project name [$defaultName]: " projName

if [ -z "$projName" ]; then
    projName=$defaultName
fi

# echo $projName

# Get user's chosen directory
read -p "Enter the parent directory [$defaultDir]: " projDir 

if [ -z "$projDir" ]; then
    projDir=$defaultDir
fi

# echo $projDir

#Create the base directory path, if it doesn't already exist
if [ ! -d "$projDir" ]; then
    mkdir -p "$projDir"
fi

echo "$projDir"/"$projName"

cd "$projDir"

# Create-React-App - 
npx create-react-app $projName
cd "$projName"

# Add AirBNB-derived prettier and linting config - https://github.com/paulolramos/eslint-prettier-airbnb-react
#See also https://blog.echobind.com/integrating-prettier-eslint-airbnb-style-guide-in-vscode-47f07b5d7d6a for instructions
exec 3<&1;bash <&3 <(curl https://raw.githubusercontent.com/paulolramos/eslint-prettier-airbnb-react/master/eslint-prettier-config.sh 2> /dev/null)

# Run prettier at Git commit with 'Pretty-quick' and Husky
# https://github.com/azz/pretty-quick
# https://github.com/typicode/husky
# https://medium.com/technical-credit/using-prettier-with-vs-code-and-create-react-app-67c2449b9d08 <= usage
yarn add --dev pretty-quick husky

# Add husky config to package.json - see https://stackoverflow.com/questions/25329241/edit-package-json-from-command-line for npe->package.json manipulation
npx npe husky.hooks.pre-commit "pretty-quick --staged"

yarn start
