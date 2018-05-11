#!/usr/bin/env bash
# -*- coding: utf-8 -*-

set -e

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
	-s|--sandbox)
	    HAB_SHELL_USE_SANDBOX=1
	    shift 1
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

upsearch () {
    slashes=${PWD//[^\/]/}
    directory="$PWD"
    for (( n=${#slashes}; n>0; --n ))
    do
	test -e "$directory/$1" && echo "$directory" && return 
	directory="$directory/.."
    done
}

cd $(upsearch plan.sh)

. results/last_build.env
hab pkg path $pkg_ident || sudo hab pkg install results/$pkg_artifact
. ./plan.sh

HAB_SHELL_FULL_CMD=". ./plan.sh; do_shell"

if [[ ! -z "$HAB_SHELL_COMMAND" ]]; then
    HAB_SHELL_FULL_CMD="$HAB_SHELL_FULL_CMD; $HAB_SHELL_COMMAND; exit $?"
fi

do_shell_interpreter --rcfile <(echo $HAB_SHELL_FULL_CMD)
