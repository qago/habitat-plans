#!/usr/bin/env sh
# -*- coding: utf-8 -*-

set -e

if [ "$#" -ne 1 ]; then
    echo "usage: hab-shell.sh <path>"
    exit 1
fi

. $1/plan.sh

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

unset PROMPT_COMMAND

export PATH=$pkg_path
export LIB=$pkg_lib
export INCLUDE=$pkg_include

do_shell
