$pkg_name="python2"
$pkg_origin="qago"
$pkg_version="2.7.14"
$pkg_license=@("LGPL")
$pkg_upstream_url="https://www.python.org/downloads/windows/"
$pkg_description="python2"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="https://www.python.org/ftp/python/2.7.14/python-2.7.14.amd64.msi"
$pkg_shasum="af293df7728b861648162ba0cd4a067299385cb6a3f172569205ac0b33190693"
$pkg_filename="python-2.7.14.amd64.msi"
$pkg_build_deps=@("core/lessmsi")
$pkg_bin_dirs=@("bin")

function Invoke-Unpack {
    lessmsi x (Resolve-Path "$HAB_CACHE_SRC_PATH/$pkg_filename").Path
    mkdir "$HAB_CACHE_SRC_PATH/$pkg_dirname"
    Move-Item "python-2.7.14.amd64/SourceDir" "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
    cp "$PLAN_CONTEXT/get-pip.py" "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
}

function Invoke-Install {
    Copy-Item * "$pkg_prefix" -Recurse -Force
    Start-Process $pkg_prefix\bin\python.exe -Wait -ArgumentList "$pkg_prefix\bin\get-pip.py" -ErrorAction SilentlyContinue
    & $pkg_prefix\bin\python.exe -m pip install --upgrade pip
}
