#!/bin/bash

diarystart() {
    if [[ $# -ne 1 ]]
    then
    echo "you must set a filepath for the new diary"
    fi
}


diaryend() {

# set starting value 

lds=$(history | grep diarystart | tail -1)
ldsn=$(history | grep diarystart | tail -1 | awk '{print $1}')
ldsf=$(history | grep diarystart | tail -1 | awk '{print $3}')

# print from that line to the end
history | awk -F " " -v line=$ldsn '{if($1 > line) print}' | awk '{$1=""; print}' > $ldsf

}



