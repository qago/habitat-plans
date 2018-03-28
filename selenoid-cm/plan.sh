pkg_name=selenoid-cm
pkg_origin=qago
pkg_version='1.3.1'
pkg_description="Selenoid cm binary"
pkg_maintainer='QAGO Maintainers'
pkg_license=('LGPL-2.1')
pkg_upstream_url="https://github.com/aerokube/selenoid"
pkg_source=https://github.com/aerokube/cm/releases/download/${pkg_version}/cm_linux_amd64
pkg_shasum=cd377c440835b3d35b33cef632bbb8a4c919e0c280209265ce976cba7ee8bd19
pkg_bin_dirs=(bin)

_install_dependency() {
    local dep="${1}"
    if [[ -z "${NO_INSTALL_DEPS:-}" ]]; then
	$HAB_BIN pkg path "$dep" || $HAB_BIN install -u $HAB_BLDR_URL --channel $HAB_BLDR_CHANNEL "$dep" || {
		if [[ "$HAB_BLDR_CHANNEL" != "$FALLBACK_CHANNEL" ]]; then
		    build_line "Trying to install '$dep' from '$FALLBACK_CHANNEL'"
		    $HAB_BIN install -u $HAB_BLDR_URL --channel "$FALLBACK_CHANNEL" "$dep" || true
		fi
	    }
    fi
    return 0
}

do_unpack () {
    return 0;
}

do_build() {
    return 0
}

do_install () {
    cp $HAB_CACHE_SRC_PATH/cm_linux_amd64 $pkg_prefix/bin/cm
    chmod '+x' $pkg_prefix/bin/cm
}
