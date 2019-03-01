#! /bin/bash
if [ "$3" == "" ] ; then echo "Usage: 1. parameter: name of the input wav file (this determines the length of the output file), 2. parameter: name of the wav file to mix with, 3. paraméter: name of the output wav file" ; exit 1 ; fi
sox -m $1 $2 $3 trim 0 `soxi -D $1`
