$pkg_name="openssh-win64"
$pkg_origin="qago"
$pkg_version="0.0.24.0"
$pkg_license=@("LGPL")
$pkg_upstream_url="https://github.com/PowerShell/Win32-OpenSSH"
$pkg_description="openssh-win64"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="https://github.com/PowerShell/Win32-OpenSSH/releases/download/0.0.24.0/OpenSSH-Win64.zip"
$pkg_shasum="b25648e6765e979929a9888b482f736776014dad252d4dee43f990683d70f9e3"
$pkg_filename="OpenSSH-Win64.zip"
$pkg_bin_dirs=@("bin")

function Invoke-Unpack {
    mkdir "$HAB_CACHE_SRC_PATH/$pkg_dirname"
    Expand-Archive -Force -Path "$HAB_CACHE_SRC_PATH/$pkg_filename" -DestinationPath $HAB_CACHE_SRC_PATH
    Move-Item $HAB_CACHE_SRC_PATH/OpenSSH-Win64 "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
}

function Invoke-Install {
    Copy-Item * "$pkg_prefix" -Recurse -Force
}
