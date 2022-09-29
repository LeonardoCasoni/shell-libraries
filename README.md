# shell-libraries
Pre packed functions to use in shell scripts

# how to use the libraries
You can add all the libraries in a dir called "lib".
Then add in every shell script this line: 
for k in lib/*.sh; do . "$k"; done;
