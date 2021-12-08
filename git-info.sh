#!/bin/bash

repoinfo () {

# what to set
token= #add your github token or comment this line if you have your token stored in a variable called "token"
usern= #add your github username

cosa=$(curl -sH "Authorization: token $token" https://api.github.com/search/repositories\?q\=user:$usern | jq '.items[].name')

# create temp file
echo $cosa > temp-git-info.txt

nlines=$(cat temp-git-info.txt | wc -l | xargs)

for i in {1..$nlines}
do
    repon=$(head -n $i  temp-git-info.txt | tail -n 1 | awk -F'\"' '{print $2}')
    aun=$(curl -su "$usern":$token https://api.github.com/repos/$usern/$repon/commits/HEAD | jq .commit.author.name | awk -F'\"' '{print $2}')
    dat=$(curl -su "$usern":$token https://api.github.com/repos/$usern/$repon/commits/HEAD | jq .commit.author.date | awk -F'\"' '{print $2}' | awk -F'T' '{print $1}')
    mess=$(curl -su "$usern":$token https://api.github.com/repos/$usern/$repon/commits/HEAD | jq .commit.message | awk -F'\"' '{print $2}')
    echo -e "\e[1;31m$repon\e[0m: pushed by \e[1;32m$aun\e[0m on \e[1;34m$dat\e[0m: $mess"

done

# remove temp file
rm temp-git-info.txt

}

topush (){

curd=$(pwd)

dirns=$(find ~ -iname .git | grep - v | awk -F'/.git$' '{print $1}') # add as many | grep -v name | as ypu need to not see unwanted repo where the first grep is. NOT after awk! I suggest "Trash" and "library" on mac
echo $dirns > temp-pull.txt

nlines=$(cat temp-pull.txt | wc -l | xargs)

for i in {1..$nlines}
do
    echo $i
    dirn=$(echo $(head -n $i temp-pull.txt | tail -n 1))
    cd $dirn

    repon=$(echo $dirn | awk -F'/' '{print $NF}')
    echo $repon
    
    nbranch=$(git branch | wc -l | xargs)
        git status -bs --ahead-behind
    cd $curd
done


rm temp-pull.txt 

}



