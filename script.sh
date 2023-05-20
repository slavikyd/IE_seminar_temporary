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

cat $input | sed 's/N/Z/g' | sort -k2nr -k3nr -k4 -k1 | sed 's/Z/N/g' > temp
head -n $seats temp > $output
rm temp
