pkg_name=browsermob-proxy-service
pkg_origin=qago
pkg_version='2.0.0'
pkg_description="Browsermob Proxy service"
pkg_maintainer='QAGO Maintainers'
pkg_license=('LGPL-2.1')
pkg_upstream_url=""
pkg_source=_no_pkg_source_
pkg_shasum=_no_pkg_shasum_

pkg_deps=(qago/browsermob-proxy)
pkg_exports=(
  [port]=port
)
pkg_exposes=(port)
pkg_svc_user="root"

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

do_install() {
    return 0
}

do_build() {
    return 0
}
