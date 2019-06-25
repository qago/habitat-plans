pkg_name=geckodriver-bin
pkg_origin=qago
pkg_version='0.23.0'
pkg_description="Geckodriver binary"
pkg_maintainer='Danil Guskov'
pkg_license=('LGPL-2.1')
pkg_upstream_url="https://github.com/mozilla/geckodriver"
pkg_source="https://github.com/mozilla/geckodriver/releases/download/v$pkg_version/geckodriver-v$pkg_version-linux64.tar.gz"
pkg_shasum=2abf02cb69b48f2ba65ea344b752ff547e5431659aad80b03bf68cdb4f8df14b
pkg_bin_dirs=(bin)

do_build() {
    return 0
}

do_install () {
    cp $HAB_CACHE_SRC_PATH/geckodriver $pkg_prefix/bin/geckodriver
    chmod '+x' $pkg_prefix/bin/geckodriver
}
