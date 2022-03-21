#! /bin/bash

CNT=$1

for (( c=1; c<=${CNT}; c++ ))
do  
    cp ~/projects/algorithm/code_template ~/playground/problem0${c} -r
done

