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

    # TODO valutare le parole in ordine

        # se non ci sono, allora...
    # valutare le parole non in ordine

        # creare stringa col comando

            # separare il comando in diverse parole
                # creo comando prima parola
                firstw=$(echo $cosafa | awk '{print $1}')
                str2eval="grep \"$firstw\" \"$filen\""

                # valuto se ci sono più parole
                nwords=$(echo $cosafa | wc -w  | xargs)

                if [[ "$nwords" -gt 1 ]]; then
                    for i in {2..$nwords}
                    do
                        wordn=$(echo "echo $cosafa | awk '{print \$$i}'")
                        wordn=$(eval $wordn)
                        str2eval="$str2eval | grep \"$wordn\""
                    done
                fi

        # eval stringa
        res=$(eval $str2eval| awk -F'\t' '{print $1 " - " $2 " - " $3}')
        echo $res


    # se non c'è nulla, rifare
    resl=$(echo $res | wc -w  | xargs)
        if [[ "$resl" -eq 0 ]]; then
            echo "Your research has given 0 results, retry"
        fi

    


}
