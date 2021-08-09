#!/bin/bash

# change directory using find function and regex
# $1 is the name of the path
# $2 is the name of the directory (or part of it)
cdf (){

    if [[ $1 == '.' ]]
    then
        find . -name "*$2*" -type d -print0 | xargs -0 cd
        return
    fi

    if [[ $1 == '~' ]]
    then
        find ~ -name "*$2*" -type d -print0 | xargs -0 cd
        return
    fi

    find $1* -name "*$2*" -type d -print0 | xargs -0 cd

}

# open file using find function and regex
# $1 is the name of the path
# $2 is the name of the file (or part of it)

opf (){

    if [[ $1 == '.' ]]
    then
        find . -name "*$2*" -type f -print0 | xargs -0 open
        return
    fi

    if [[ $1 == ~ ]]
    then
        find ~ -name "*$2*" -type f -print0 | xargs -0 open
        return
    fi
    
    find *$1* -name "*$2*" -type f -print0 | xargs -0 open
}