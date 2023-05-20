#!/bin/bash

chmod +x script.sh

echo "Arguments test"
./script.sh
out_test=`echo $?`
if [[ out_test -eq 1 ]]
then
    echo "Arguments test passed, proceeding to next test"
else
    echo "Arguments test failed, exiting..."
    exit 1
fi

echo "Execution test"
./script.sh -f input.txt -o output.txt -t 3
out_test=`echo $?`
if [[ out_test -eq 0 ]]
then
    if [[ -f output.txt ]]
    then
        echo "Exection test passed, proceeding to next test"
    else
        echo "Test failed, exiting..."
        exit 1
    fi
else
    echo "Test failed, exiting..."
    exit 1
fi

echo "Output values tests"
echo "First input sample"
./script.sh -f input.txt -o output.txt -t 3
out_test=`echo $?`
if [[ out_test -eq 0 ]]
then
    for line in $(cat output.txt)
    do
        for line_sample in $(cat output_sample.txt)
        do
            if [[ $line != $line_sample ]]
                then
                    echo "Test failed"
                    exit 1
            else
                echo "Test passed"
                exit 0
            fi
        done
    done
else
        echo "Test failed"
        exit 1
fi