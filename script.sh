#!/bin/bash
while [[ -n $1 ]]
do
	case $1 in
		-f) input=$2
        shift;;
		-o) output=$2
        shift;;
		-t) seats=$2
        shift;;
		*) echo "Unknown argument $1"
        shift;;
	esac
	shift
done

if [[ ! -f $input ]]
then
    echo "$input is not file"
    exit 1
fi

if [[ ! -f $output ]]
then
    touch $output
fi

cat $input | sort -k2,2r -k3,3r > temp
head -n $seats temp > $output
rm temp
