pkg_name=hab-shell
pkg_origin=qago
pkg_version='0.51.0'
pkg_description="Hab shell"
pkg_maintainer='QAGO Maintainers'
pkg_license=('LGPL-2.1')
pkg_upstream_url="https://github.com/qago/habitat-plans"
pkg_source=_no_pkg_source
pkg_shasum="3d569869d27b48860210c758c4f313082103a5e58219a7669b52bfd29d674780"
pkg_deps=(
    core/hab
    core/bash
    core/coreutils
    core/gawk
    core/grep
    core/sed
)
pkg_bin_dirs=(bin)

do_download() {
    return 0
}

do_unpack() {
    return 0
}

do_verify() {
    return 0
}

do_prepare() {
    return 0
}

do_install() {
    # mkdir bin
    cp $PLAN_CONTEXT/bin/hab-shell.sh $pkg_prefix/bin/hab-shell
}

do_build() {
    return 0
}
