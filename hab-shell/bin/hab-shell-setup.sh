#!/usr/bin/env sh
# -*- coding: utf-8 -*-

function hab-shell() {
    $(hab pkg path qago/hab-shell)/bin/hab-shell.sh "$@"
}
