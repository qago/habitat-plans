$pkg_name="python"
$pkg_origin="qago"
$pkg_version="3.6.4"
$pkg_license=@("LGPL")
$pkg_upstream_url="https://www.python.org/downloads/windows/"
$pkg_description="python"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="https://www.python.org/ftp/python/3.6.4/python-3.6.4-embed-amd64.zip"
$pkg_shasum="f6ca955d6885a2ac01595dc7857c5c06ee0a5b1f7b3774f89ec52692c7cb691c"
$pkg_filename="python-3.6.4-embed-amd64.zip"
$pkg_bin_dirs=@("bin")

function Invoke-Unpack {
    Expand-Archive -Path "$HAB_CACHE_SRC_PATH/$pkg_filename" -DestinationPath "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
    cp "$PLAN_CONTEXT/python36._pth" "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
    cp "$PLAN_CONTEXT/get-pip.py" "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
}

function Invoke-Install {
    Copy-Item * "$pkg_prefix" -Recurse -Force
    & $pkg_prefix\bin\python.exe $pkg_prefix\bin\get-pip.py
}
