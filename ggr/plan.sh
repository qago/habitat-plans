pkg_name=ggr
pkg_origin=qago
pkg_version='1.3.0'
pkg_description="Selenoid grid router"
pkg_maintainer='QAGO Maintainers'
pkg_license=('LGPL-2.1')
pkg_upstream_url="https://github.com/aerokube/ggr"
pkg_source=https://github.com/aerokube/ggr/releases/download/${pkg_version}/ggr_linux_amd64
pkg_shasum=8b15bb0c1e01477712fa430824f35186d86dffa7ea7d9786159e0c4c4c64c35d
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
    cp $HAB_CACHE_SRC_PATH/ggr_linux_amd64 $pkg_prefix/bin/ggr
    chmod '+x' $pkg_prefix/bin/ggr
}
