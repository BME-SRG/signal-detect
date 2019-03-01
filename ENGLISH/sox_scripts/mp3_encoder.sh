#! /bin/bash
if [ "$2" == "" ] ; then echo "Usage: 1. parameter: name of the input wav file, 2. parameter: name of the output wav file" ; exit 1 ; fi
sox $1 -C 16 temp.mp3
sox temp.mp3 -r 16000 -t wavpcm -e signed-integer $2
rm temp.mp3
