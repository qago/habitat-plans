#!/usr/bin/env sh
# -*- coding: utf-8 -*-

pkg_name="test"
pkg_origin="qago"
pkg_version="1.0"

pkg_deps=(
    core/bash
    core/python
    core/ruby
    core/go
)

do_shell() {
    return 0
}

do_shell_login() {
    bash
}
