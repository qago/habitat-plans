$pkg_name="phantomjs"
$pkg_origin="qago"
$pkg_version="2.1.1"
$pkg_license=@("LGPL")
$pkg_upstream_url="http://phantomjs.org"
$pkg_description="phantomjs"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-windows.zip"
$pkg_shasum="d9fb05623d6b26d3654d008eab3adafd1f6350433dfd16138c46161f42c7dcc8"
$pkg_filename="phantomjs-2.1.1-windows.zip"
$pkg_bin_dirs=@("bin")

function Invoke-Unpack {
    mkdir "$HAB_CACHE_SRC_PATH/$pkg_dirname"
    Expand-Archive -Force -Path "$HAB_CACHE_SRC_PATH/$pkg_filename" -DestinationPath $HAB_CACHE_SRC_PATH
    Move-Item $HAB_CACHE_SRC_PATH/phantomjs-$pkg_version-windows/bin "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
}

function Invoke-Install {
    Copy-Item * "$pkg_prefix" -Recurse -Force
}
