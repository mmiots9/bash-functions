#!/bin/bash

renameDir() {

mv $1 $(echo $1 | awk 'BEGIN {FS="[ -]"; OFS="_"} {\
for(i=1; i<NF; ++i) {
$i = toupper( substr( $i, 1, 1 ) ) substr( $i, 2 ) 
printf "%s_", $i}; 
$NF = toupper( substr( $NF, 1, 1 ) ) substr( $NF, 2 )
print $NF; print ""}')

}

renameFile() {

mv $1 $(echo $1 | awk 'BEGIN {FS="[ _-]"; OFS=""} {\
for(i=1; i<=NF; ++i) {
$i = toupper( substr( $i, 1, 1 ) ) substr( $i, 2 ) 
printf "%s", $i}; 
print ""}')

}

renameAll(){
    for f in *; do
    if [ -f $f ]; then renameFile $f; fi
    if [ -d $f ]; then renameDir $f; fi
    done
}


