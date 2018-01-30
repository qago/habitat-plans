$pkg_name="ffmpeg"
$pkg_origin="qago"
$pkg_version="20170411-f1d80bc"
$pkg_license=@("LGPL")
$pkg_upstream_url="https://www.ffmpeg.org/"
$pkg_description="ffmpeg"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="http://ffmpeg.zeranoe.com/builds/win64/static/ffmpeg-20170411-f1d80bc-win64-static.zip"
$pkg_shasum="b8a5dd32c06e6007019015e3dd37a4b32bdb6f3c4cb5c6432c237397f419d6d7"
$pkg_filename="ffmpeg-20170411-f1d80bc-win64-static.zip"
$pkg_bin_dirs=@("bin")

function Invoke-Unpack {
    mkdir "$HAB_CACHE_SRC_PATH/$pkg_dirname"
    Expand-Archive -Force -Path "$HAB_CACHE_SRC_PATH/$pkg_filename" -DestinationPath $HAB_CACHE_SRC_PATH
    Move-Item $HAB_CACHE_SRC_PATH/ffmpeg-$pkg_version-win64-static/bin "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
}

function Invoke-Install {
    Copy-Item * "$pkg_prefix" -Recurse -Force
}
