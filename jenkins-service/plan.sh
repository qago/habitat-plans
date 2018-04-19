pkg_name=jenkins-service
pkg_origin=qago
pkg_version='1.0.21'
pkg_description="Jenkins service"
pkg_maintainer='QAGO Maintainers'
pkg_license=('LGPL-2.1')
pkg_upstream_url=""
pkg_source=_no_pkg_source_
pkg_shasum=_no_pkg_shasum_

pkg_deps=(
    core/jenkins/2.89.4/20180403233836
    core/wget
    core/netcat
    core/bash
    core/grep
    core/sed
    core/unzip
    core/coreutils
)

pkg_exports=(
  [port]=jenkins-service.port
)
pkg_exposes=(port)
pkg_svc_user="hab"

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
