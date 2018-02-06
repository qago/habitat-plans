$pkg_name="gpg4win"
$pkg_origin="qago"
$pkg_version="3.0.3"
$pkg_license=@("LGPL")
$pkg_upstream_url="http://gpg4win.org"
$pkg_description="gpg4win"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="http://files.gpg4win.org/gpg4win-$pkg_version.exe"
$pkg_shasum="477f56212ee60cc74e0c5e5cc526cec52a069abff485c89c2d57d1b4b6a54971"
$pkg_filename="gpg4win-$pkg_version.exe"
$pkg_bin_dirs=@("GnuPG\bin", "gpg4win-3.0.3\bin")

function Invoke-Unpack {
    echo pkg_dirname:
    echo $HAB_CACHE_SRC_PATH/$pkg_dirname
    mkdir "$HAB_CACHE_SRC_PATH/$pkg_dirname"
    Start-Process "$HAB_CACHE_SRC_PATH/$pkg_filename" "/S /D=$HAB_CACHE_SRC_PATH\$pkg_dirname" -NoNewWindow -Wait
}

function Invoke-Install {
    echo pkg_prefix:
    echo $pkg_prefix
    Copy-Item . "$pkg_prefix" -Recurse -Force
    Copy-Item ../GnuPG "$pkg_prefix" -Recurse -Force
}

function Invoke-End {
    Start-Process "$HAB_CACHE_SRC_PATH/$pkg_dirname/gpg4win-uninstall.exe" "/S" -NoNewWindow -Wait
}
