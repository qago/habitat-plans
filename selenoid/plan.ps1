$pkg_name="selenoid"
$pkg_origin="qago"
$pkg_version="1.7.1"
$pkg_license=@("LGPL")
$pkg_upstream_url="https://github.com/aerokube/selenoid"
$pkg_description="selenoid"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="https://github.com/aerokube/selenoid/releases/download/$pkg_version/selenoid_windows_amd64.exe"
$pkg_shasum="8d100bb713386784ee959535e7e6440fa56ed51cc7df6522910fbdd1d81d0129"
$pkg_filename="selenoid.exe"
$pkg_bin_dirs=@("bin")

function Invoke-Unpack {
    mkdir "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
    Copy-Item "$HAB_CACHE_SRC_PATH/$pkg_filename" "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
}

function Invoke-Install {
    Copy-Item * "$pkg_prefix" -Recurse -Force
}
