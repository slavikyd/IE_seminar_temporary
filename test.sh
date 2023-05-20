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
./script.sh -f test.txt -o output.txt -t 3
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
./script.sh -f test.txt -o output.txt -t 3
out_test=`echo $?`
if [[ out_test -eq 0 ]]
then
    if [[ `cat output_sample.txt` == `cat output.txt` ]]
    then
        echo "Test passed"
        exit 0
    else
        echo "Test failed"
        exit 1
    fi
else
        echo "Test failed"
        exit 1
fi