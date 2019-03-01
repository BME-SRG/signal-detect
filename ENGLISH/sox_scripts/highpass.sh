#! /bin/bash
if [ "$3" == "" ] ; then echo "Usage: 1. parameter: name of the input wav file, 2. parameter: cutoff frequency, 3. parameter: name of the output wav file" ; exit 1 ; fi
sox $1 $3 highpass $2
