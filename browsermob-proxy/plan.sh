pkg_name=browsermob-proxy
pkg_origin=qago
pkg_version=2.0.0
pkg_maintainer="Browsermob Proxy service"
pkg_description="A free utility to help web developers watch and manipulate network traffic from their AJAX applications. "
pkg_license=('LGPL-2.1')
pkg_upstream_url="https://github.com/lightbody/browsermob-proxy"
pkg_source=https://github.com/lightbody/${pkg_name}/releases/download/${pkg_name}-${pkg_version}/${pkg_name}-${pkg_version}-bin.zip
pkg_shasum="686c6fa330ca2579ab4e2df9209d7e457d4d7965f634f4c12a0fc3575dcce935"
pkg_build_deps=(core/unzip)
pkg_deps=(core/jre8 core/coreutils core/which)
pkg_bin_dirs=(bin)
pkg_lib_dirs=(lib)

do_build() {
    return 0
}

do_unpack() {
    cd "${HAB_CACHE_SRC_PATH}" || exit
    unzip ${pkg_filename}
}

do_install() {
    cp * $pkg_prefix -rf
}

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
