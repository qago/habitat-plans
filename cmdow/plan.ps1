$pkg_name="cmdow"
$pkg_origin="qago"
$pkg_version="1.4.8"
$pkg_license=@("LGPL")
$pkg_upstream_url="https://ritchielawrence.github.io/cmdow/"
$pkg_description="cmdow"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="https://github.com/ritchielawrence/cmdow/archive/v1.4.8.zip"
$pkg_shasum="f5c5289a6c26aff63dd27af321ba0392ce3f5c2ed0e6bfcd07d8c7952c468ac9"
$pkg_filename="v1.4.8.zip"
$pkg_bin_dirs=@("bin")

function Invoke-Unpack {
    mkdir "$HAB_CACHE_SRC_PATH/$pkg_dirname"
    Expand-Archive -Force -Path "$HAB_CACHE_SRC_PATH/$pkg_filename" -DestinationPath $HAB_CACHE_SRC_PATH
    Move-Item $HAB_CACHE_SRC_PATH/cmdow-$pkg_version/bin/Release/cmdow.exe "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
}

function Invoke-Install {
    Copy-Item * "$pkg_prefix" -Recurse -Force
}
