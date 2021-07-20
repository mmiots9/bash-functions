#!/bin/bash

addshort () {

    # chiedere quale file
    PS3='Seleziona in quale file aggiungere il comando: '
    arr=("mac" "bash" "RStudio" "VSCode" "nano")
    select opt in "${arr[@]}"
    do
        filen=~/git_desk/Studio/linguaggi/cheatsheet/$opt.txt
        break
    done

    # chiedere quale comando, cosa fa e what it does
    echo "Quale è la combinazione di tasti?"
    read combinazione

    # vedere se già presente ed eventualmente segnalarlo
    condit=$(grep "$combinazione" "$filen" | wc -l)

    if [[ "$condit" -gt 0 ]]; then
        echo This combination is already present
        return
    fi

    echo "Cosa fa?"
    read cosafa

    echo "what it does?"
    read whatdoes

    # inserire combinazione nel file giusto
    echo -e "$combinazione\t$cosafa\t$whatdoes" >> $filen
}

searchshort () {

    # chiedere quale file
    PS3='Seleziona in quale file aggiungere il comando: '
    arr=("mac" "bash" "RStudio" "VSCode" "nano")
    select opt in "${arr[@]}"
    do
        filen=~/git_desk/Studio/linguaggi/cheatsheet/$opt.txt
        break
    done

    # chiedere quale comando
    echo "Quale shortcut stai cercando?"
    read cosafa

    # TODO 

    grep "$cosafa" "$filen" | awk -F'\t' '{print $1 " - " $2 " - " $3}'

    # TODO se non c'è nulla, rifare

}
