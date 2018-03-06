#!/usr/bin/env sh
# -*- coding: utf-8 -*-

. ./plan.sh

for plg in "${jenkins_plugins[@]}"
do
    hab pkg path $plg || ./build_plugin.rb $plg
done

hab studio build -R .
. results/last_build.env
sudo hab pkg install results/$pkg_artifact
