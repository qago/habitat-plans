pkg_name=jenkins-graphiteIntegrator
pkg_origin=qago
pkg_version="1.2"
pkg_description="Jenkins graphiteIntegrator plugin"
pkg_maintainer='QAGO Maintainers'
pkg_license=('LGPL-2.1')
pkg_upstream_url=""
pkg_source=_no_pkg_source_
pkg_shasum=_no_pkg_shasum_
pkg_deps=(
    core/bash
    core/grep
    core/sed
    core/unzip
    core/curl
)

do_unpack() {
    return 0
}

do_verify() {
    return 0
}

do_prepare() {
    return 0
}

do_clean() {
    # Prevent rm -rf "$CACHE_PATH"
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

do_download() {
    mkdir -p $HAB_CACHE_SRC_PATH/$pkg_dirname/plugins
    bash $PLAN_CONTEXT/install_jenkins_plugin.sh -d $HAB_CACHE_SRC_PATH/$pkg_dirname/plugins graphiteIntegrator@1.2
}

do_install() {
    cp -r plugins $pkg_prefix/plugins
}

do_build() {
    return 0
}
