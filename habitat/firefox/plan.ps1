$pkg_name="firefox"
$pkg_origin="qago"
$pkg_version="62.0.3"
$pkg_license=@("LGPL")
$pkg_upstream_url="https://www.mozilla.org"
$pkg_description="firefox"
$pkg_maintainer="Danil Guskov"
$pkg_source="http://download.mozilla.org/?product=firefox-$pkg_version&os=win&lang=en-US"
$pkg_shasum="8e92223b4fa4938e6e4e77034eb75648ae8a30d034e2c5a6df3466e9352217e5"
$pkg_filename="firefox_setup.exe"
$pkg_bin_dirs=@("core")
$pkg_build_deps=@("core/7zip")

function Invoke-Unpack {
    7z x "$HAB_CACHE_SRC_PATH/$pkg_filename" -O"$HAB_CACHE_SRC_PATH/$pkg_dirname"
}

function Invoke-Install {
    Copy-Item * "$pkg_prefix" -Recurse -Force
}
