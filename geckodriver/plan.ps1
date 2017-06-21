$pkg_name="geckodriver"
$pkg_origin="qago"
$pkg_version=If ($env:HAB_QAGO_GECKODRIVER_PKG_VERSION) {$env:HAB_QAGO_GECKODRIVER_PKG_VERSION} Else {"0.17.0"}
$pkg_license=@("LGPL")
$pkg_upstream_url="https://github.com/mozilla/geckodriver"
$pkg_description="geckodriver"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="https://github.com/mozilla/geckodriver/releases/download/v$pkg_version/geckodriver-v$pkg_version-win64.zip"
$pkg_shasum="6fa0dd98d2d9aab4f8b57419ab2359e0b28fb9b44106b0fadefb157c0f6a15fd"
$pkg_filename="geckodriver-v$pkg_version-win64.zip"
$pkg_bin_dirs=@("bin")

function Invoke-Unpack {
    mkdir "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
    Expand-Archive -Path "$HAB_CACHE_SRC_PATH/$pkg_filename" -DestinationPath "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
}

function Invoke-Install {
    Copy-Item * "$pkg_prefix" -Recurse -Force
}

function Invoke-Verify { }
