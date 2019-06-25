pkg_name=qago-plans
pkg_origin=qago
pkg_version='1.20'
pkg_description="QAGO habitat plans"
pkg_maintainer='QAGO'
pkg_upstream_url="https://github.com/qago/habitat-plans"

RUBY_VERSION=2.5.1

pkg_deps=(
    core/bash/4.4.19/20180608092913
    core/coreutils/8.29/20180608092141
    core/docker/18.03.0/20180608150948
    core/gawk/4.2.0/20180608093856
    core/git/2.18.0/20181218161804
    core/grep/3.1/20180608092809
    core/hab/0.71.0/20181218014130
    core/make/4.2.1/20180608100733
    core/rsync/3.1.2/20180608145950
    core/ruby/2.5.1/20181212185250
    core/sed/4.4/20180608091938
    core/sshpass/1.06/20180608151129
    core/sudo/1.8.18p1/20181219210923
    core/tar/1.30/20180608093304
    core/which/2.21/20180608164236
)

do_shell() {
    . ~/.bashrc
    unset HAB_CACHE_KEY_PATH
    export HAB_ORIGIN="qago"
    
    ruby_bundle_path=$HOME/.hab-shell/ruby/bundle/$RUBY_VERSION

    mkdir -p $ruby_bundle_path
    export BUNDLE_PATH=$ruby_bundle_path

    pushd "$( builtin cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" > /dev/null
    bundle install --binstubs > /dev/null
    popd > /dev/null

    export PATH="$( builtin cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.hab-shell/bin:$PATH"
    export PATH="$( builtin cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/bin:$PATH"
}

do_build() {
    return 0
}

do_install() {
    return 0
}

