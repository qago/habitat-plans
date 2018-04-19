pkg_name=hab-shell
pkg_origin=qago
pkg_version='1.0'
pkg_description="Hab shell"
pkg_maintainer='QAGO Maintainers'
pkg_license=('LGPL-2.1')
pkg_upstream_url="https://github.com/qago/habitat-plans"
pkg_source=_no_pkg_source_
pkg_shasum=_no_pkg_shasum_
pkg_deps=(
    core/hab
    core/bash
    core/coreutils
    core/gawk
    core/grep
    core/sed
    core/sudo
)
pkg_bin_dirs=(bin)

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

do_install() {
    cp $PLAN_CONTEXT/bin/hab-shell.sh $pkg_prefix/bin/hab-shell
    cp $PLAN_CONTEXT/bin/hab-shell.sh $pkg_prefix/bin/hab-shell.sh
    cp $PLAN_CONTEXT/bin/hab-shell-setup.sh $pkg_prefix/bin/hab-shell-setup.sh
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


do_build() {
    return 0
}
