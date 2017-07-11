$pkg_name="ps2exe"
$pkg_origin="qago"
$pkg_version="0.5.0.0"
$pkg_license=@("LGPL")
$pkg_upstream_url="https://gallery.technet.microsoft.com/PS2EXE-Convert-PowerShell-9e4e07f1"
$pkg_description="ps2exe"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="https://github.com/qago/ps2exe/releases/download/0.5.0.0/ps2exe.exe"
$pkg_shasum="faa8c510495d1771c96b464541b574bcd4094f79349991eb222d4174a56f6bc3"
$pkg_filename="ps2exe.exe"
$pkg_bin_dirs=@("bin")

function Invoke-Unpack {
    mkdir "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
    Copy-Item "$HAB_CACHE_SRC_PATH/$pkg_filename" "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
}

function Invoke-Install {
    Copy-Item * "$pkg_prefix" -Recurse -Force
}
