$pkg_name="selenoid-chrome"
$pkg_origin="qago"
$pkg_version="_set_from_google_chrome_package_"
$pkg_license=@("LGPL")
$pkg_upstream_url="https://github.com/aerokube/selenoid"
$pkg_description="selenoid chrome node"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="_no_pkg_source_"
$pkg_build_deps=@("qago/google-chrome","qago/chromedriver")
$pkg_bin_dirs=@("bin")

function Invoke-Download { }

function Invoke-Unpack {
    Set-PackageVersion
}

function Set-PackageVersion {
    $chrome_version_full_path = "$(Get-HabPackagePath "google-chrome")/.."
    $script:pkg_version = $(New-Object -ComObject Scripting.FileSystemObject).GetFolder($chrome_version_full_path).Name
    $script:pkg_dirname="$pkg_name-$pkg_version"
    $script:pkg_prefix="$HAB_PKG_PATH/$pkg_origin/$pkg_name/$pkg_version/$pkg_release"
    $script:pkg_artifact="$HAB_CACHE_ARTIFACT_PATH/$pkg_origin-$pkg_name-$pkg_version-$pkg_release-$pkg_target.$_artifact_ext"
}

function Invoke-Install {
    Copy-Item "$(Get-HabPackagePath 'google-chrome')/bin" "$pkg_prefix" -Recurse -Force
    Copy-Item "$(Get-HabPackagePath 'chromedriver')/bin" "$pkg_prefix" -Recurse -Force
}

function Invoke-Verify { }
