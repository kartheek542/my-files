#!/bin/bash

# extract the name of the most recently modified java file
cfile=$(ls -t *.java | head -1 | cut -d"." -f1)

#compile the above extracted java file
javac $cfile.java

# check if the compilation is successfull or not
if [ $? -eq 0 ]
then
    # if input file exists run java file using the input file
    if [ -s inp.in ]
    then
        java $cfile < inp.in
    else
        # if input file is not present run the java file normally
        java $cfile
    fi
fi
