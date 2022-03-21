#! /bin/bash

backup() {
    if [[ -d ~/.create_env.bak ]]; then
     rm ~/.create_env.bak -rf
    fi
    mkdir ~/.create_env.bak
    mv ~/playground/* ~/.create_env.bak
}

CNT=$1

backup

for (( c=1; c<=${CNT}; c++ ))
do  
    cp -r ~/projects/algorithm/code_template ./playground/problem0${c}
done

