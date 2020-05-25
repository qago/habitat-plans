pkg_name=selenoid-s3-bin
pkg_origin=qago
pkg_version='1.10.0'
pkg_description="Selenoid amd64 binary with s3 feature support."
pkg_maintainer='QAGO members'
pkg_license=('LGPL-2.1')
pkg_upstream_url="https://github.com/aerokube/selenoid"
pkg_source="https://github.com/qago/habitat-plans/releases/download/${pkg_version}/selenoid_s3_linux_amd64"
pkg_shasum=fc3e83f255ce30e9049b4ada9084a7c9dd219d718bcc9028e737a4178b5e38aa
pkg_bin_dirs=(bin)

do_unpack () {
    return 0
}

do_build() {
    return 0
}

do_install () {
    cp $HAB_CACHE_SRC_PATH/selenoid_s3_linux_amd64 $pkg_prefix/bin/selenoid
    chmod '+x' $pkg_prefix/bin/selenoid
}
