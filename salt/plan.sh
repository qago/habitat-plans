pkg_name=salt
pkg_distname=${pkg_name}
pkg_version=2017.7.5
pkg_origin=qago
pkg_license=('MIT')
pkg_maintainer='QAGO Maintainers'
pkg_description="Salt binaries"
pkg_upstream_url=http://saltstack.com/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://github.com/saltstack/salt/releases/download/v${pkg_version}/salt-${pkg_version}.tar.gz
pkg_shasum=d41ff6d5962361e92e926db8f24c5f2284817f9f78128b2546527258a3a2d8c6
pkg_deps=(
    core/python
    core/gcc
    qago/openssl
)

pkg_bin_dirs=(bin)
pkg_lib_dirs=(lib)

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

do_prepare() {
    mkdir -p "${pkg_prefix}/lib/python3.6/site-packages"
}

do_setup_environment() {
    push_runtime_env PYTHONPATH "${pkg_prefix}/lib/python3.6/site-packages"
    push_runtime_env LD_LIBRARY_PATH "$(pkg_path_for qago/openssl)/lib"
}

do_build() {
    return 0
}

do_install() {
    pip install . --prefix="$pkg_prefix"
}
