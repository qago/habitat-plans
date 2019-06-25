$pkg_name="chromedriver-bin"
$pkg_origin="qago"
$pkg_version="2.42"
$pkg_license=@("LGPL")
$pkg_upstream_url="http://chromedriver.storage.googleapis.com"
$pkg_description="chromedriver"
$pkg_maintainer="Danil Guskov"
$pkg_source="http://chromedriver.storage.googleapis.com/$pkg_version/chromedriver_win32.zip"
$pkg_shasum="fefe53f05cfd190a01c259a56e34e1fdeb604a24ec38f170e6f001eca505f2f7"
$pkg_filename="chromedriver_$pkg_version_win32.zip"
$pkg_bin_dirs=@("bin")

function Invoke-Unpack {
    mkdir "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
    Expand-Archive -Path "$HAB_CACHE_SRC_PATH/$pkg_filename" -DestinationPath "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
}

function Invoke-Install {
    Copy-Item * "$pkg_prefix" -Recurse -Force
}


