Prettier-Linted-CRA

A simple, interactive, Bash script configuring AirBNB's ESLint and Prettier configurations during new Create-React-App-based ReactJS project creation (Javascript/JSX).  

The script also adds linting during Git commits via Husky (Git Hooks).  

1. To run the script, copy and execute the following command:  
`bash <(curl -s http://mywebsite.com/myscript.txt)`  

2. The script will ask the project name and where to create the new ReactJS Javascript project. **N.B. it *doesn't* create Typescript-based projects, yet).**  

In order to have Visual Studio Code (VSCode) alert you to any Prettier and ESLint formatting issues, please install the following VSCode plugins:

- [ESLint VSCode plugin by Dirk Baeumer][vsc-eslint]
- [Prettier VSCode plugin by Esben Petersen][vsc-prettier]

Finally, this Bash script was created on Mac OSX but should work on Linux and most *nixes. It assumes that you have a recent version of NodeJS installed with NPM/NPX, available on the PATH.  

This simple script was made possible via the following projects:

- Create-React-App - https://github.com/facebook/create-react-app
- eslint-prettier-airbnb-react - https://github.com/paulolramos/eslint-prettier-airbnb-react
- Prettier - https://prettier.io
- ESLint - https://eslint.org/
- AirBnB ESLint configuaration - https://github.com/airbnb/javascript/tree/master/packages/eslint-config-airbnb
- Pretty-quick - https://github.com/azz/pretty-quick
- Husky - https://github.com/typicode/husky


[vsc-eslint]: https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint
[vsc-prettier]: https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode
