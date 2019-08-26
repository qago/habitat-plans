pkg_name=selenoid-ui-bin
pkg_origin=qago
pkg_version='1.8.1'
pkg_description="Selenoid UI linux amd64 binary"
pkg_maintainer='QAGO members'
pkg_license=('LGPL-2.1')
pkg_upstream_url="https://github.com/aerokube/selenoid-ui"
pkg_source=https://github.com/aerokube/selenoid/releases/download/${pkg_version}/selenoid-ui_linux_amd64
pkg_shasum=364c1f660489b9751856c15c05bd720a5a814b8a1874f49409bd4a4603fcd1e8
pkg_bin_dirs=(bin)

do_unpack () {
    return 0
}

do_build() {
    return 0
}

do_install () {
    cp $HAB_CACHE_SRC_PATH/selenoid-ui_linux_amd64 $pkg_prefix/bin/selenoid-ui
    chmod '+x' $pkg_prefix/bin/selenoid-ui
}
