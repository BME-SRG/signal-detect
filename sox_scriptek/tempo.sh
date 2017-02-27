#! /bin/bash
if [ "$3" == "" ] ; then echo "Így használd: 1. paraméter: bemenő wav fájl neve, 2. paraméter: tempo paraméter, 3. paraméter: kimenő wav fájl neve" ; exit 1 ; fi
sox $1 $3 tempo $2
