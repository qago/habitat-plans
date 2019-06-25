pkg_name=selenoid-bin
pkg_origin=qago
pkg_version='1.8.0'
pkg_description="Geckodriver Binary"
pkg_maintainer='Danil Guskov'
pkg_license=('LGPL-2.1')
pkg_upstream_url="https://github.com/aerokube/selenoid"
pkg_source=https://github.com/aerokube/selenoid/releases/download/${pkg_version}/selenoid_linux_amd64
pkg_shasum=8e7f36b6212c1ad4cb5e83fed4c2b12ea029555cf2e015cbba3eec2e4daf8491
pkg_bin_dirs=(bin)

do_unpack () {
    return 0
}

do_build() {
    return 0
}

do_install () {
    cp $HAB_CACHE_SRC_PATH/selenoid_linux_amd64 $pkg_prefix/bin/selenoid
    chmod '+x' $pkg_prefix/bin/selenoid
}
