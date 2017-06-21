$pkg_name="strings"
$pkg_origin="qago"
$pkg_version="2.53"
$pkg_license=@("LGPL")
$pkg_upstream_url="https://technet.microsoft.com/en-us/sysinternals/bb897439"
$pkg_description="strings"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="https://download.sysinternals.com/files/Strings.zip"
$pkg_shasum="515054da37cbac23e7b90c43aadf874eacb20ba225e57c701dc9b291207249b4"
$pkg_filename="Strings.zip"
$pkg_bin_dirs=@("bin")

function Invoke-Unpack {
    mkdir "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
    Expand-Archive -Path "$HAB_CACHE_SRC_PATH/$pkg_filename" -DestinationPath "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
}

function Invoke-Install {
    Copy-Item * "$pkg_prefix" -Recurse -Force
}
