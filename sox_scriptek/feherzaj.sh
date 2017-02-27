#! /bin/bash
if [ "$3" == "" ] ; then echo "Így használd: 1. paraméter: bemenő wav fájl neve, 2. paraméter: zaj amplitúdója, 3. paraméter: kimenő wav fájl neve" ; exit 1 ; fi
sox $1 -p synth whitenoise vol $2 | sox -m $1 - $3
