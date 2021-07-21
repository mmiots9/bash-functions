#!/bin/bash

addshort () {

    # things to set
    arr=() #insert the name of the file, WITHOUT THE EXTENSION
    ext='' #set file extension
    filepath='' #set the path for the directory into which are stored the files
    whatdoes='' #set the string corresponding to what it does in your language

    # ask which file
    PS3='Select which file to add into: '
    
    select opt in "${arr[@]}"
    do
        filen=$filepath/$opt$ext
        break
    done

    # ask which command, what it does and what it does in your language
    echo "Which is the shortcut command?"
    read combination

    # evaluate if already present
    condit=$(grep "$combination" "$filen" | wc -l)

    if [[ "$condit" -gt 0 ]]; then
        echo This combination is already present
        return
    fi

    # UNCOMMENT these lines if you want to add your own language explanation
    # echo $whatdoes
    # read whatdoeslan

    echo "what it does?"
    read whatdoes

    # insert in file
        # UNCOMMENT this line if you add your own language explanation
        # echo -e "$combination\t$whatdoeslan\t$whatdoes" >> $filen

        # comment this line if tyou have add your own language explanation
        echo -e "$combination\t$whatdoes" >> $filen
}

searchshort () {

    # things to set
    arr=() #insert the name of the file, WITHOUT THE EXTENSION
    ext='' #set file extension
    filepath='' #set the path for the directory into which are stored the files
    whatdoes='' #set the string corresponding to what it does in your language

    # ask which file
    PS3='Select which file to search into '
    select opt in "${arr[@]}"
    do
        filen=$filepath/$opt$ext
        break
    done

    # ask which command
    echo "Which shortcut are you searching for?"
    read whatdoes

    # evaluate searched words

            # separate each word
                # cfirst word
                firstw=$(echo $whatdoes | awk '{print $1}')
                str2eval="grep \"$firstw\" \"$filen\""

                # evaluate if there are more words and eventually append command
                nwords=$(echo $whatdoes | wc -w  | xargs)

                if [[ "$nwords" -gt 1 ]]; then
                    for i in {2..$nwords}
                    do
                        wordn=$(echo "echo $whatdoes | awk '{print \$$i}'")
                        wordn=$(eval $wordn)
                        str2eval="$str2eval | grep \"$wordn\""
                    done
                fi

        # eval string
            # uncomment this line if you you add your own language explanation
            # res=$(eval $str2eval| awk -F'\t' '{print $1 " - " $2 " - " $3}')

            #comment this line if you add your own language explanation
            res=$(eval $str2eval| awk -F'\t' '{print $1 " - " $2}')

        echo $res


    # if no results
    resl=$(echo $res | wc -w  | xargs)
        if [[ "$resl" -eq 0 ]]; then
            echo "Your research has given 0 results, retry"
        fi

}
