#! /bin/bash
if [ "$4" == "" ] ; then echo "Így használd: 1. paraméter: bemenő wav fájl neve, 2. paraméter: kivágás kezdete, 3. paraméter: kivágás hossza, 4. paraméter: kimenő wav fájl neve" ; exit 1 ; fi
sox $1 $4 trim $2 $3
