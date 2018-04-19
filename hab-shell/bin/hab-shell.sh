#!/usr/bin/env sh
# -*- coding: utf-8 -*-

set -e

upsearch () {
    slashes=${PWD//[^\/]/}
    directory="$PWD"
    for (( n=${#slashes}; n>0; --n ))
    do
	test -e "$directory/$1" && echo "$directory/$1" && return 
	directory="$directory/.."
    done
}

HAB_SHELL_PLAN=$(upsearch plan.sh)

while (( "$#" )); do
    case "$1" in
	-c|--command)
	    HAB_SHELL_COMMAND="$2"
	    shift 2
	    ;;
	-p|--plan)
	    HAB_SHELL_PLAN="$2"
	    shift 2
	    ;;
	--) # end argument parsing
	    shift
	    break
	    ;;
	-*|--*=) # unsupported flags
	echo "Error: Unsupported flag $1" >&2
	exit 1
	;;
    esac
done

. $(realpath $HAB_SHELL_PLAN)

pkg_path=""
pkg_lib=""
pkg_include=""

for pkg in "${pkg_deps[@]}"
do
    hab pkg path $pkg || sudo hab pkg install $pkg
    env="$(hab pkg env $pkg)"
    cur_path=$(echo $env | grep PATH= | awk -F "=" '{print $2}' | sed 's/"//g')
    cur_lib=$(echo $env | grep LIB= | awk -F "=" '{print $2}' | sed 's/"//g')
    cur_include=$(echo $env | grep INCLUDE= | awk -F "=" '{print $2}' | sed 's/"//g')
    pkg_path="$pkg_path:$cur_path"
    pkg_lib="$pkg_path:$cur_lib"
    pkg_include="$pkg_path:$cur_include"
done

export PATH=$pkg_path
export LIB=$pkg_lib
export INCLUDE=$pkg_include

export HAB_SHELL_PLAN=$(realpath $HAB_SHELL_PLAN)

do_shell
if [[ ! -z "$HAB_SHELL_COMMAND" ]]; then
    do_shell_command() {
    	$HAB_SHELL_COMMAND
    }
fi

if typeset -f do_shell_command > /dev/null
then
    do_shell_command
else
    if typeset -f do_shell_login > /dev/null; then
	do_shell_login
    fi
fi
