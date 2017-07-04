$pkg_name="firefox"
$pkg_origin="qago"
$pkg_version=If ($env:HAB_QAGO_FIREFOX_PKG_VERSION) {$env:HAB_QAGO_FIREFOX_PKG_VERSION} Else {"54.0"}
$pkg_license=@("LGPL")
$pkg_upstream_url="https://www.mozilla.org"
$pkg_description="firefox"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="http://download.mozilla.org/?product=firefox-$pkg_version&os=win&lang=en-US"
$pkg_shasum="84828015baff99df74c3324e99dee2679873d75285dd37a62ec3ff0cb3eb5ef8"
$pkg_filename="firefox_setup.exe"
$pkg_bin_dirs=@("core")
$pkg_build_deps=@("core/7zip")

function Invoke-Unpack {
    7z x "$HAB_CACHE_SRC_PATH/$pkg_filename" -O"$HAB_CACHE_SRC_PATH/$pkg_dirname"
}

function Invoke-Install {
    Copy-Item * "$pkg_prefix" -Recurse -Force
}

function Invoke-Verify { }
