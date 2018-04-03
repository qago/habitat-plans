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
    core/jenkins/2.89.4/20180221042204
    core/wget/1.19.1/20171024102323
    core/netcat/0.7.1/20170514150813
    core/bash/4.3.42/20170513213519
    core/grep/2.22/20170513213444
    core/sed/4.2.2/20170513213123
    core/unzip/6.0/20170513215357
    core/coreutils/8.25/20170513213226
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
