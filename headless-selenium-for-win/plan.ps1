$pkg_name="headless-selenium-for-win"
$pkg_origin="qago"
$pkg_version="1.4"
$pkg_license=@("LGPL")
$pkg_upstream_url="https://github.com/kybu/headless-selenium-for-win"
$pkg_description="selenoid"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="https://github.com/kybu/headless-selenium-for-win/releases/download/v$pkg_version/headless-selenium-for-win-v1-4.zip"
$pkg_shasum="9b23979fc3ae692b13cded44c10032985f842c8dc7b35e33096c625c52759f5e"
$pkg_filename="headless-selenium-for-win-v1-4.zip"
$pkg_bin_dirs=@("bin")

function Invoke-Unpack {
    mkdir "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
    Expand-Archive -Force -Path "$HAB_CACHE_SRC_PATH/$pkg_filename" -DestinationPath $HAB_CACHE_SRC_PATH
    Move-Item $HAB_CACHE_SRC_PATH/headless-selenium-for-win-v1-4/* $HAB_CACHE_SRC_PATH/$pkg_dirname/bin/
}

function Invoke-Install {
    Copy-Item * "$pkg_prefix" -Recurse -Force
}
