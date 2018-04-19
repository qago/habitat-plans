pkg_name=powershell
pkg_origin=core
pkg_version=6.0.2
pkg_license=('MIT')
pkg_upstream_url=https://msdn.microsoft.com/powershell
pkg_description="PowerShell is a cross-platform (Windows, Linux, and macOS) automation and configuration tool/framework that works well with your existing tools and is optimized for dealing with structured data (e.g. JSON, CSV, XML, etc.), REST APIs, and object models. It includes a command-line shell, an associated scripting language and a framework for processing cmdlets."
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_source="https://github.com/PowerShell/PowerShell/releases/download/v6.0.2/powershell_6.0.2-1.ubuntu.16.04_amd64.deb"
pkg_shasum=9e16d366277bc51bf2aa3e610989cc69f9f41f0274dce03d7ba4571b3fa895cf

pkg_deps=(
    core/dotnet-core
    core/gcc
    core/glibc
    core/gcc-libs
    core/icu
    core/util-linux
    core/krb5
    core/libunwind
    core/lttng-ust
    core/openssl
)
pkg_build_deps=(
    core/patchelf
    core/dpkg
)

pkg_bin_dirs=(bin)
pkg_lib_dirs=(lib)

do_unpack() {
    dpkg -x "$HAB_CACHE_SRC_PATH/$pkg_filename" "$HAB_CACHE_SRC_PATH/$pkg_dirname"
}

do_build() {
    return 0
}

do_install() {
    cp -r opt/microsoft/powershell/6.0.2/* "$pkg_prefix/bin"
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
