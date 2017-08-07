$pkg_name="nssm"
$pkg_origin="qago"
$pkg_version="2.24"
$pkg_license=@("LGPL")
$pkg_upstream_url="https://nssm.cc"
$pkg_description="NSSM - the Non-Sucking Service Manager"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="https://nssm.cc/release/nssm-$pkg_version.zip"
$pkg_shasum="727d1e42275c605e0f04aba98095c38a8e1e46def453cdffce42869428aa6743"
$pkg_filename="nssm-2.24.zip"
$pkg_bin_dirs=@("bin")

function Invoke-Unpack {
    mkdir "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
    Expand-Archive -Path "$HAB_CACHE_SRC_PATH/$pkg_filename" -DestinationPath $HAB_CACHE_SRC_PATH
    Copy-Item $HAB_CACHE_SRC_PATH/nssm-$pkg_version/win64/* "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
}

function Invoke-Install {
    Copy-Item * "$pkg_prefix" -Recurse -Force
}
