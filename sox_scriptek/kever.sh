#! /bin/bash
if [ "$3" == "" ] ; then echo "Így használd: 1. paraméter: bemenő wav fájl neve (ez határozza meg a kimenő fájl hosszát), 2. paraméter: hozzákeverendő bemenő wav fájl neve, 3. paraméter: kimenő wav fájl neve" ; exit 1 ; fi
sox -m $1 $2 $3 trim 0 `soxi -D $1`
