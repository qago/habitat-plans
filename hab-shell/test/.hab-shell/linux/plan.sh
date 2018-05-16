pkg_name="test"
pkg_origin="qago"
pkg_version="1.0.7"

pkg_hab_shell_interpreter="bash"

pkg_deps=(
    core/bash
    core/coreutils
    core/python
    core/python2
    core/gawk
    core/which
    core/virtualenv
    core/git
    core/gcc
    core/hab
    core/grep
    core/sed
    core/sudo
    core/ruby/2.4.3/20180402222624
    core/sshpass
    core/rsync
    core/make
)

do_shell() {
    . ~/.bashrc
}

do_build() {
    return 0
}

do_install() {
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
