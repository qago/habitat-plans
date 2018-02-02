$pkg_name="openssh-cygwin"
$pkg_origin="qago"
$pkg_version="7.6p1-1"
$pkg_license=@("LGPL")
$pkg_upstream_url="http://www.mls-software.com"
$pkg_description="cmdow"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="https://www.mls-software.com/files/setupssh-7.6p1-1.exe"
$pkg_shasum="0f38977b9f270daedea66302f9067e07f75809371090747f0b0ca806dc626c89"
$pkg_filename="setupssh-7.6p1-1.exe"
$pkg_bin_dirs=@("bin", "usr/sbin")

function Invoke-Unpack {
    mkdir "$HAB_CACHE_SRC_PATH/$pkg_dirname"
    Start-Process "$HAB_CACHE_SRC_PATH/$pkg_filename" "/S /port=2224 /privsep=1 /password=setup /D=$HAB_CACHE_SRC_PATH\$pkg_dirname" -NoNewWindow -Wait
    echo $HAB_CACHE_SRC_PATH\$pkg_filename
}

function Invoke-Install {
    Copy-Item bin "$pkg_prefix" -Recurse -Force
    Copy-Item etc "$pkg_prefix" -Recurse -Force
    Copy-Item usr "$pkg_prefix" -Recurse -Force
}

function Invoke-End {
    Start-Process "$HAB_CACHE_SRC_PATH/$pkg_filename" "/S" -NoNewWindow -Wait
}
