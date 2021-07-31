#!/bin/bash

# change directory using find function and regex
# $1 is the name of the path
# $2 is the name of the directory (or part of it)
cdf (){

    if [[ $1 == '.' ]]
    then
        cd $(find . -name "*$2*" -type d)
        return
    fi

    if [[ $1 == '~' ]]
    then
        cd $(find ~ -name "*$2*" -type d)
        return
    fi

    cd $(find $1* -name "*$2*" -type d)

}

# open file using find function and regex
# $1 is the name of the path
# $2 is the name of the file (or part of it)

opf (){

    if [[ $1 == '.' ]]
    then
        open $(find . -name "*$2*" -type f)
        return
    fi

    if [[ $1 == ~ ]]
    then
        open $(find ~ -name "*$2*" -type f)
        return
    fi
    
    open $(find *$1* -name "*$2*" -type f)
}