$pkg_name="selenoid"
$pkg_origin="qago"
$pkg_version="1.2.1b"
$pkg_license=@("LGPL")
$pkg_upstream_url="https://github.com/aerokube/selenoid"
$pkg_description="selenoid"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="https://github.com/guskovd/selenoid/releases/download/$pkg_version/selenoid.exe"
$pkg_shasum="c887aa66a8272f8f67ed08d35a14cea27476ba1faa796010debc8dc18582f85f"
$pkg_filename="selenoid.exe"
$pkg_deps=@("core/hab/0.25.1", "core/powershell")
$pkg_bin_dirs=@("bin")

function Invoke-Unpack {
    mkdir "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
    Copy-Item "$HAB_CACHE_SRC_PATH/$pkg_filename" "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
}

function Invoke-Install {
    Copy-Item * "$pkg_prefix" -Recurse -Force
}

function Invoke-Verify { }
