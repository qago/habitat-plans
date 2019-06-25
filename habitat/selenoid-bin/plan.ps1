$pkg_name="selenoid-bin"
$pkg_origin="qago"
$pkg_version="1.8.0"
$pkg_license=@("LGPL")
$pkg_upstream_url="https://github.com/aerokube/selenoid"
$pkg_description="selenoid"
$pkg_maintainer="Danil Guskov"
$pkg_source="https://github.com/aerokube/selenoid/releases/download/$pkg_version/selenoid_windows_amd64.exe"
$pkg_shasum="1c9d0b16acc75593fed62bd1b1de2f56179150806a30704d73b490cfbddc1e05"
$pkg_filename="selenoid.exe"
$pkg_bin_dirs=@("bin")

function Invoke-Unpack {
    mkdir "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
    Copy-Item "$HAB_CACHE_SRC_PATH/$pkg_filename" "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
}

function Invoke-Install {
    Copy-Item * "$pkg_prefix" -Recurse -Force
}
