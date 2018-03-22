$pkg_name="selenoid"
$pkg_origin="qago"
$pkg_version="1.5.2"
$pkg_license=@("LGPL")
$pkg_upstream_url="https://github.com/aerokube/selenoid"
$pkg_description="selenoid"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="https://github.com/aerokube/selenoid/releases/download/$pkg_version/selenoid_windows_amd64.exe"
$pkg_shasum="0291e0002ec58a12ac429e13d9a792ae70e21451561025c2364d748bf17e2b05"
$pkg_filename="selenoid.exe"
$pkg_deps=@("core/hab", "core/powershell")
$pkg_bin_dirs=@("bin")

function Invoke-Unpack {
    mkdir "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
    Copy-Item "$HAB_CACHE_SRC_PATH/$pkg_filename" "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
}

function Invoke-Install {
    Copy-Item * "$pkg_prefix" -Recurse -Force
}
