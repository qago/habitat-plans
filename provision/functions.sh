#!/usr/bin/env sh
# -*- coding: utf-8 -*-

function sync() {
    if [[ "$(uname -s)" == "Linux" ]]; then # Linux setup
	echo "skip"
    else
	rsync -qrazc ./habitat rsync://#{hostname}/#{data_path i}
    fi
}
