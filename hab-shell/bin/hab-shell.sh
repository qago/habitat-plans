#!/usr/bin/env bash
# -*- coding: utf-8 -*-

set -e

HAB_SHELL_PLAN=./plan.sh
HAB_SHELL_DIRECTORY=$PWD

while (( "$#" )); do
    case "$1" in
	-c|--command)
	    HAB_SHELL_COMMAND="$2"
	    shift 2
	    ;;
	-d|--directory)
	    HAB_SHELL_DIRECTORY="$( cd "$2" && pwd )"
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
    slashes=${HAB_SHELL_DIRECTORY//[^\/]/}
    directory="$HAB_SHELL_DIRECTORY"
    for (( n=${#slashes}; n>0; --n ))
    do
	test -e "$directory/$1" && echo "$directory" && return 
	directory="$directory/.."
    done
}

PLAN_SH_DIRECTORY=$(upsearch $HAB_SHELL_PLAN)

cd $PLAN_SH_DIRECTORY

. results/last_build.env
hab pkg path $pkg_ident || sudo hab pkg install results/$pkg_artifact
. $HAB_SHELL_PLAN

HAB_SHELL_FULL_CMD=". $PLAN_SH_DIRECTORY/plan.sh; do_shell"

cd -

if [[ ! -z "$HAB_SHELL_COMMAND" ]]; then
    HAB_SHELL_FULL_CMD="$HAB_SHELL_FULL_CMD; $HAB_SHELL_COMMAND"
    hab pkg exec $pkg_ident $pkg_hab_shell_interpreter -c "$HAB_SHELL_FULL_CMD"
else
    hab pkg exec $pkg_ident $pkg_hab_shell_interpreter --rcfile <(echo $HAB_SHELL_FULL_CMD)
fi
