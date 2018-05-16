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

hab_shell_setup () {
    mkdir -p $HOME/.hab-shell/cache

    if [ ! -d "$HOME/.hab-shell/cache/keys" ]; then
	cp -r "$( builtin cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../keys" $HOME/.hab-shell/cache
    fi
    
    export HAB_CACHE_KEY_PATH="$HOME/.hab-shell/cache/keys"
    export HAB_ORIGIN="hab-shell"
}

pkg_rebuild () {
    mkdir -p .hab-shell/linux
    cp plan.sh .hab-shell/linux
    pushd .hab-shell/linux > /dev/null

    . ./plan.sh

    plan_pkg_origin=$pkg_origin
    plan_pkg_version=$pkg_version

    if [ ! -f "results/last_build.env" ]; then
	rm results -rf
	hab studio build -R .
    fi

    . results/last_build.env

    if [ ! "$plan_pkg_version" == "$pkg_version" ]; then
	rm results -rf

	hab pkg build -R .
	. results/last_build.env
    fi

    hab pkg path $pkg_ident > /dev/null || sudo hab pkg install results/$pkg_artifact
    popd > /dev/null
}

hab_shell_setup

PLAN_SH_DIRECTORY=$(upsearch $HAB_SHELL_PLAN)
pushd $PLAN_SH_DIRECTORY > /dev/null

pkg_rebuild

popd > /dev/null
HAB_SHELL_FULL_CMD=". $PLAN_SH_DIRECTORY/plan.sh; do_shell"

if [[ ! -z "$HAB_SHELL_COMMAND" ]]; then
    HAB_SHELL_FULL_CMD="$HAB_SHELL_FULL_CMD; $HAB_SHELL_COMMAND"
    hab pkg exec $pkg_ident $pkg_hab_shell_interpreter -c "$HAB_SHELL_FULL_CMD"
else
    hab pkg exec $pkg_ident $pkg_hab_shell_interpreter --rcfile <(echo $HAB_SHELL_FULL_CMD)
fi
