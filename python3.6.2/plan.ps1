$pkg_name="python"
$pkg_origin="qago"
$pkg_version="3.6.2"
$pkg_license=@("LGPL")
$pkg_upstream_url="https://www.python.org/downloads/windows/"
$pkg_description="python"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="https://www.python.org/ftp/python/3.6.2/python-3.6.2-embed-amd64.zip"
$pkg_shasum="a59c12dbf953d3cdedc678a4f9195e87e717f10c8b0a42ed3fb7092bef523528"
$pkg_filename="python-3.6.2-embed-amd64.zip"
$pkg_bin_dirs=@("bin")

function Invoke-Unpack {
    Expand-Archive -Path "$HAB_CACHE_SRC_PATH/$pkg_filename" -DestinationPath "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
    Expand-Archive -Path $HAB_CACHE_SRC_PATH/$pkg_dirname/bin/python36.zip -DestinationPath "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin/Lib"
    cp "$PLAN_CONTEXT/python36._pth" "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
    cp "$PLAN_CONTEXT/get-pip.py" "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
}

function Invoke-Install {
    Copy-Item * "$pkg_prefix" -Recurse -Force
    & $pkg_prefix\bin\python.exe $pkg_prefix\bin\get-pip.py pip==9.0.1
}
