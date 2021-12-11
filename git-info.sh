#!/bin/bash

repoinfo () {

# what to set
token= #add your github token or comment this line if you have your token stored in a variable called "token"
usern= #add your github username

cosa=$(curl -sH "Authorization: token $token" https://api.github.com/search/repositories\?q\=user:$usern | jq '.items[].name')

# creo file temporaneo
if [[ $# -ne 0 ]]
then
echo $cosa > temp2-git-info.txt

n=$(echo "$*")
f=$(echo "${n// /\|}")
grep $f temp2-git-info.txt > temp-git-info.txt
rm temp2-git-info.txt
else
echo $cosa > temp-git-info.txt
fi

nlines=$(cat temp-git-info.txt | wc -l | xargs)

# loop through repos
for i in {1..$nlines}
do
    
    # repo name
    repon=$(head -n $i  temp-git-info.txt | tail -n 1 | awk -F'\"' '{print $2}')

    # get branches
    branches=$(curl -su "$usern":$token https://api.github.com/repos/$usern/$repon/branches | jq '.[].name')
    echo $branches > temp-branches.txt
    


    nbranches=$(cat temp-branches.txt | wc -l | xargs)

    # loop through branches
    for j in {1..$nbranches}
    do
        brn=$(head -n $j  temp-branches.txt | tail -n 1 | awk -F'\"' '{print $2}')

        aun=$(curl -su "$usern":$token https://api.github.com/repos/$usern/$repon/branches/$brn | jq .commit.commit.author.name | awk -F'\"' '{print $2}')
        dat=$(curl -su "$usern":$token https://api.github.com/repos/$usern/$repon/branches/$brn | jq .commit.commit.author.date | awk -F'\"' '{print $2}' | awk -F'T' '{print $1}')
        tim=$(curl -su "$usern":$token https://api.github.com/repos/$usern/$repon/branches/$brn | jq .commit.commit.author.date | awk -F'\"' '{print $2}' | awk -F'T' '{print $2}' | awk -F'Z' '{print $1}')
        mess=$(curl -su "$usern":$token https://api.github.com/repos/$usern/$repon/branches/$brn | jq .commit.commit.message | awk -F'\"' '{print $2}')
        echo -e "\e[1;31m$repon/$brn\e[0m: pushed by \e[1;32m$aun\e[0m on \e[1;34m$dat\e[0m at \e[1;34m$tim\e[0m: $mess"
    done

    rm temp-branches.txt
    echo -e ""
done


rm temp-git-info.txt

}





topush (){

curd=$(pwd)

dirns=$(find ~ -iname .git | grep -v oh-my | grep -v Trash |grep -v Library | grep -v .vim | awk -F'/.git$' '{print $1}')
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

    # for j in {1..$nbranch}
    # do
    #     whichbr=$(git branch | head -n $j | tail -n 1 | awk -F' ' '{print $NF}')
    #     git checkout $whichbr
        git status -bs --ahead-behind
    # done
    cd $curd
done


rm temp-pull.txt 

}

# curl -s https://api.github.com/repos/mmiots9/mmiots9/branches | jq '.[].commit.url' # da lavorarci su bene








