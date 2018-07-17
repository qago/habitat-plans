$pkg_name="iedriver"
$pkg_origin="qago"
$pkg_version="3.13"
$pkg_license=@("LGPL")
$pkg_upstream_url="http://www.seleniumhq.org"
$pkg_description="iedriver"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="http://selenium-release.storage.googleapis.com/$pkg_version/IEDriverServer_Win32_$pkg_version.0.zip"
$pkg_shasum="3b7a48679a39a0969063f521568d3477c54a1a4e77e43bad15b52e8c5d07cc86"
$pkg_filename="IEDriverServer_x64_$pkg_version.0.zip"
$pkg_bin_dirs=@("bin")

function Invoke-Unpack {
    mkdir "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
    Expand-Archive -Path "$HAB_CACHE_SRC_PATH/$pkg_filename" -DestinationPath "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
}

function Invoke-Install {
    Copy-Item * "$pkg_prefix" -Recurse -Force
}
