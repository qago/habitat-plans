pkg_name=allure
pkg_origin=qago
pkg_version=2.6.0
pkg_maintainer=""
pkg_description="The next generation of Allure Report, a flexible lightweight multi-language test report tool with the possibility to add steps, attachments, parameters and so on."
pkg_license=('Apache License 2.0')
pkg_upstream_url="https://github.com/allure-framework/allure2"
pkg_source=https://dl.bintray.com/qameta/generic/io/qameta/allure/allure/${pkg_version}/allure-${pkg_version}.zip
pkg_shasum="d2600c93b2a7db748e11e6e158c0c32fe0e53e86881632f021e4a3c80b60ca14"
pkg_build_deps=(core/unzip)
pkg_deps=(core/jre8 core/coreutils core/which core/bash)
pkg_bin_dirs=(bin)
pkg_lib_dirs=(lib)

do_build() {
    return 0
}

do_unpack() {
    cd "${HAB_CACHE_SRC_PATH}" || exit
    unzip -o ${pkg_filename}
}

do_install() {
    pwd
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
