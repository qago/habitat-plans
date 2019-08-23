pkg_name=ggr-ui-bin
pkg_origin=qago
pkg_version='1.1.2'
pkg_description="Selenoid grid router ui binary"
pkg_maintainer='QAGO members'
pkg_license=('LGPL-2.1')
pkg_upstream_url="https://github.com/aerokube/ggr-ui"
pkg_source=https://github.com/aerokube/ggr/releases/download/${pkg_version}/ggr-ui_linux_amd64
pkg_shasum=88877ee0592f9cab30914ed0a5028d810b5180376ad3c48e7aec925e6fcf48f4
pkg_bin_dirs=(bin)

do_unpack () {
    return 0;
}

do_build() {
    return 0
}

do_install () {
    cp $HAB_CACHE_SRC_PATH/ggr-ui_linux_amd64 $pkg_prefix/bin/ggr-ui
    chmod '+x' $pkg_prefix/bin/ggr-ui
}
