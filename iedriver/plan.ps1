$pkg_name="iedriver"
$pkg_origin="qago"
$pkg_version="Win32_3.4.0"
$pkg_license=@("LGPL")
$pkg_upstream_url="http://www.seleniumhq.org"
$pkg_description="iedriver"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="http://selenium-release.storage.googleapis.com/3.4/IEDriverServer_$pkg_version.zip"
$pkg_shasum="823e1f31e738417a31718b903573b40b88fe91abbff672cc17a91e1b717ad78b"
$pkg_filename="IEDriverServer_x64_$pkg_version.0.zip"
$pkg_bin_dirs=@("bin")

function Invoke-Unpack {
    mkdir "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
    Expand-Archive -Path "$HAB_CACHE_SRC_PATH/$pkg_filename" -DestinationPath "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
}

function Invoke-Install {
    Copy-Item * "$pkg_prefix" -Recurse -Force
}
