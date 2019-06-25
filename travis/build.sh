#!/usr/bin/env bash
# -*- coding: utf-8 -*-

set -e

export HAB_ORIGIN="qago"
HAB_FULL_NAME='hab-0.79.0-20190409150529-x86_64-linux'

if [[ -z "$tmp" ]]; then
    export TEMP=/tmp
fi

if [[ "$(uname -s)" == "Linux" ]]; then # Linux setup
    echo "export GITHUB_TOKEN=$GITHUB_TOKEN" > habitat/tmp/env.sh
    os_name="linux"
    cp -rf provision/.hab $HOME/.hab
    if [[ ! -f /usr/bin/hab ]]; then
	pushd /tmp > /dev/null
	curl -L https://dl.bintray.com/habitat/stable/linux/x86_64/${HAB_FULL_NAME}.tar.gz -O
	tar -xzf ${HAB_FULL_NAME}.tar.gz
	sudo cp ${HAB_FULL_NAME}/hab /usr/bin/hab
	popd > /dev/null
    fi
    results=results
    last_build=results/last_build.env
else # Windows setup
    echo "\$env:GITHUB_TOKEN=\"$GITHUB_TOKEN\"" > habitat/tmp/env.ps1
    os_name="windows"
    cp -rf provision/.hab C:/hab
    if [[ ! -x $(command -v hab) ]]; then
	choco install habitat --version 0.79.0
    fi
    results=habitat/${HAB_PKG}/results
    last_build=habitat/${HAB_PKG}/results/last_build.ps1
fi

hab studio build habitat/${HAB_PKG}

pkg_artifact=$(cat $last_build | grep pkg_artifact | awk -F '=' '{print $2}' | sed $'s/[\r:\"]//g')
pkg_ident=$(cat $last_build | grep pkg_ident | awk -F '=' '{print $2}' | sed $'s/[\r:\"]//g')
pkg_origin=$(cat $last_build | grep pkg_origin | awk -F '=' '{print $2}' | sed $'s/[\r:\"]//g')
pkg_version=$(cat $last_build | grep pkg_version | awk -F '=' '{print $2}' | sed $'s/[\r:\"]//g')
pkg_name=$(cat $last_build | grep pkg_name | awk -F '=' '{print $2}' | sed $'s/[\r:\"]//g')

echo "Upload artifacts if need ..."

search_result=$(hab pkg search $pkg_origin/$pkg_name | grep $pkg_origin/$pkg_name/$pkg_version || echo "")

if [[ -z "$search_result" ]] || [[ ! $(echo $search_result | xargs -n 1 hab pkg channels | grep $os_name) ]]; then
    echo "Uploading artifact ..."
    hab pkg upload $results/$pkg_artifact
    hab pkg promote $pkg_ident $os_name
    hab pkg promote $pkg_ident stable
else
    echo "Package $pkg_origin/$pkg_name promoted to $os_name channel exist on hab depot. Skip"
fi
