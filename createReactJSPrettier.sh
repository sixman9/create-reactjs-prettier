#!/bin/bash

defaultName=my-prettier-react-app
defaultDir=/tmp

# Get user's chosen app name
read -p "Enter your project name [$defaultName]: " projName

if [ -z "$projName" ]; then
    projName=$defaultName
fi

# make $projName lowercase
projName=`echo $projName | tr '[:upper:]' '[:lower:]'`

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

cd "$projDir"

# Create-React-App - https://github.com/facebook/create-react-app

PS3='Which programming language do you want for your project?: '
options=("JavaScript" "TypeScript")
select opt in "${options[@]}"; do
    case "$opt" in
    "JavaScript")
        npx create-react-app $projName

        # Add AirBNB-derived prettier and linting config - https://github.com/paulolramos/eslint-prettier-airbnb-react
        #See also https://blog.echobind.com/integrating-prettier-eslint-airbnb-style-guide-in-vscode-47f07b5d7d6a for instructions
        exec 3<&1 bash <&3 <(curl https://raw.githubusercontent.com/paulolramos/eslint-prettier-airbnb-react/master/eslint-prettier-config.sh 2>/dev/null)
        break
        ;;
    "TypeScript")
        npx create-react-app $projName --template ts-prettier-eslint-airbnb
        break
        ;;
    *) echo Invalid ;;
    esac
done

cd ./"$projName"

# Run prettier at Git commit with 'Pretty-quick' and Husky
# https://github.com/azz/pretty-quick
# https://github.com/typicode/husky
# https://medium.com/technical-credit/using-prettier-with-vs-code-and-create-react-app-67c2449b9d08 <= usage
yarn add --dev pretty-quick husky

# Add husky config to package.json - see https://stackoverflow.com/questions/25329241/edit-package-json-from-command-line for npe->package.json manipulation
npx npe husky.hooks.pre-commit "pretty-quick --staged"

echo -e 
echo "Run 'cd $projDir/$projName' to enter your new project directory. 'yarn start' for a dev build."
echo -e