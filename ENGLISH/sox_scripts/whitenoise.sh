#! /bin/bash
if [ "$3" == "" ] ; then echo "Usage: 1. parameter: name of the input wav file, 2. parameter: amplitude of the noise, 3. parameter: name of output wav file" ; exit 1 ; fi
sox $1 -p synth whitenoise vol $2 | sox -m $1 - $3
