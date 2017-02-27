#! /bin/bash
if [ "$2" == "" ] ; then echo "Így használd: 1. paraméter: bemenő wav fájl neve, 2. paraméter: kimenő wav fájl neve" ; exit 1 ; fi
sox $1 -C 16 temp.mp3
sox temp.mp3 -r 16000 -t wavpcm -e signed-integer $2
rm temp.mp3
