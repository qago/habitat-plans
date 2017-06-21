$pkg_name="chromedriver"
$pkg_origin="qago"
$pkg_version=If ($env:HAB_QAGO_CHROMEDRIVER_PKG_VERSION) {$env:HAB_QAGO_CHROMEDRIVER_PKG_VERSION} Else {"2.20"}
$pkg_license=@("LGPL")
$pkg_upstream_url="http://chromedriver.storage.googleapis.com"
$pkg_description="chromedriver"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="http://chromedriver.storage.googleapis.com/$pkg_version/chromedriver_win32.zip"
$pkg_shasum="16238f85d8a7f1664ce8c66864de6e1a2810e380dd465edf2a29c631434b4d08"
$pkg_filename="chromedriver_$pkg_version_win32.zip"
$pkg_bin_dirs=@("bin")

function Invoke-Unpack {
    mkdir "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
    Expand-Archive -Path "$HAB_CACHE_SRC_PATH/$pkg_filename" -DestinationPath "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
}

function Invoke-Install {
    Copy-Item * "$pkg_prefix" -Recurse -Force
}

function Invoke-Verify { }
