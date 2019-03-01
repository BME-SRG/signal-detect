#! /bin/bash
if [ "$4" == "" ] ; then echo "Usage: 1. parameter: name of the input wav file, 2. parameter: start of the cut, 3. parameter: lenght of the cut, 4. parameter: name of the output wav file" ; exit 1 ; fi
sox $1 $4 trim $2 $3
