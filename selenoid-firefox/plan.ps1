$pkg_name="selenoid-firefox"
$pkg_origin="qago"
$pkg_version="_set_from_firefox_package_"
$pkg_license=@("LGPL")
$pkg_upstream_url="https://github.com/aerokube/selenoid"
$pkg_description="selenoid firefox node"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="_no_pkg_source_"
$pkg_deps=@("qago/firefox","qago/geckodriver")

function Invoke-Download { }

function Invoke-Unpack {
    Set-PackageVersion
}

function Set-PackageVersion {
    $firefox_version_full_path = "$(Get-HabPackagePath "firefox")/.."
    $script:pkg_version = $(New-Object -ComObject Scripting.FileSystemObject).GetFolder($firefox_version_full_path).Name
    $script:pkg_dirname="$pkg_name-$pkg_version"
    $script:pkg_prefix="$HAB_PKG_PATH/$pkg_origin/$pkg_name/$pkg_version/$pkg_release"
    $script:pkg_artifact="$HAB_CACHE_ARTIFACT_PATH/$pkg_origin-$pkg_name-$pkg_version-$pkg_release-$pkg_target.$_artifact_ext"
}

function Invoke-Install { }

function Invoke-Verify { }
