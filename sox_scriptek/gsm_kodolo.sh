#! /bin/bash
if [ "$2" == "" ] ; then echo "Így használd: 1. paraméter: bemenő wav fájl neve, 2. paraméter: kimenő wav fájl neve" ; exit 1 ; fi
sox $1 -r 8000 -c1 temp.gsm lowpass 4000 compand 0.02,0.05 -60,-60,-30,-10,-20,-8,-5,-8,-2,-8 -8 -7 0.05
sox temp.gsm -r 16000 -t wavpcm -e signed-integer $2
rm temp.gsm
