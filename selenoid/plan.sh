pkg_name=selenoid
pkg_origin=qago
pkg_version='1.4.0'
pkg_description="Selenoid binary"
pkg_maintainer='QAGO Maintainers'
pkg_license=('LGPL-2.1')
pkg_upstream_url="https://github.com/aerokube/selenoid"
pkg_source=https://github.com/aerokube/selenoid/releases/download/${pkg_version}/selenoid_linux_amd64
pkg_shasum=4bdd6efe19711cf8fee3f58a9f39586905cdc0e65326591c598bf85d274a8958
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
    cp $HAB_CACHE_SRC_PATH/selenoid_linux_amd64 $pkg_prefix/bin/selenoid
    chmod '+x' $pkg_prefix/bin/selenoid
}
