$pkg_name="pstools"
$pkg_origin="qago"
$pkg_version="1.0.0"
$pkg_license=@("LGPL")
$pkg_upstream_url="https://download.sysinternals.com"
$pkg_description="pstools"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="https://download.sysinternals.com/files/PSTools.zip"
$pkg_shasum="91c36d9794f031f9756c4b2c2dbfd315c83e05be13fd3932cba878794b4e828e"
$pkg_filename="PSTools.zip"
$pkg_bin_dirs=@("bin")

function Invoke-Unpack {
    mkdir "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
    Expand-Archive -Path "$HAB_CACHE_SRC_PATH/$pkg_filename" -DestinationPath "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
}

function Invoke-Install {
    Copy-Item * "$pkg_prefix" -Recurse -Force
}
