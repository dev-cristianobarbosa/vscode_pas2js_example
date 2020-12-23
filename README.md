# VsCode and Pas2JS 

This project contains configuration files to use the VSCode editor and the Pas2Js compiler.

# Features

  - Compile the entire project by saving changes to a .pas or .lpr file;
  - Automatic loading with changes in the browser. HotReload

Process:
  - Clone the repository;
  - Change the nodemon.jon file, enter the pas2js compiler path:
  ```sh
"pas": "[path_bin_pas2js]/pas2js -Jc -Jirtl.js -Tbrowser -Jminclude -JRjs {{filename}}",
"lpr": "[path_bin_pas2js]/pas2js -Jc -Jirtl.js -Tbrowser -Jminclude -JRjs {{filename}} -Fu[path_pas2js]/trunk/packages/fcl-db"
``` 
       
  - Open a terminal window and enter the command:
  ```sh
$ npm install
$ npm run dev
```
- Open the demoxhr.html file with Live Server
