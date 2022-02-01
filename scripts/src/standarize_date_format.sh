#! /usr/bin/bash

usage () {
    echo "standarize_date_format.sh: Format all files (except directories) in this directory to Date Format(2022-01-02_hello.md) by their modify time"
    echo ""
    echo "Usage:"
    echo "        sf        Print this page"
    echo "        sf dof    Format filename to Date Format"
    echo "        sf dod    Format folders name to Data Format"
    echo "        sf undof  Unformat all filename from Date Format"
    echo "        sf undod  Unformat all folders from Date Format"
}

solve () {
    TYPE=$1 
	# Step 1. replace all spaces to '-'
	rename 's/ /-/g' *
	
	# Step 2.1 format 20200101 to 2020-01-01
	for f in $(find . -maxdepth 1 -type ${TYPE} -printf '%P\n' | grep -E "[0-9]{8}")
	do
		FILENAME=$(echo ${f} | sed -e 's/.\{6\}/&-/' -e 's/.\{4\}/&-/')
		mv -n "${f}" "${FILENAME}" 
	done
	
	# Step 2.2 format 2020-01-01-hello.md to 2020-01-01_hello.md
	for f in $(find . -maxdepth 1 -type ${TYPE} -printf '%P\n' | grep -E "[0-9]{4}-[0-9]{2}-[0-9]{2}-")
	do
		FILENAME=$(echo ${f} | sed -e 's/./_/11')
		mv -n "${f}" "${FILENAME}"
	done
	
	# Step 3. add 2020-01-01_ to all files
	for f in $(find . -maxdepth 1 -type ${TYPE} -printf '%P\n' | grep -v -E "[0-9]{4}-[0-9]{2}-[0-9]{2}")
	do
		FILENAME=$(date -r "$f" +'%Y-%m-%d'_${f})
		mv -n "${f}" "${FILENAME}"
	done
}

unsolve () {
    TYPE=$1 
    for f in $(find . -maxdepth 1 -type ${TYPE} -printf '%P\n' | grep -E "[0-9]{4}-[0-9]{2}-[0-9]{2}_")
	do
		FILENAME=$(echo ${f} | cut -c 12-)
		mv -n "${f}" "${FILENAME}"
	done
}

main () {
    ARG=$1
    if [[ "dof" ==  ${ARG} ]]; then
        solve f
    elif [[ "dod" == ${ARG} ]]; then
        solve d
    elif [[ "undof" == ${ARG} ]]; then
        unsolve f
    elif [[ "undod" == ${ARG} ]]; then
        unsolve d
    else
        usage
    fi
}

main $@
