$pkg_name="google-chrome"
$pkg_origin="qago"
$pkg_version="latest"
$pkg_license=@("LGPL")
$pkg_upstream_url="http://www.google.com/chrome"
$pkg_description="Google Chrome web browser"
$pkg_maintainer="QAGO members"
$pkg_source="https://dl-ssl.google.com/tag/s/appguid=%7B00000000-0000-0000-0000-000000000000%7D&iid=%7B00000000-0000-0000-0000-000000000000%7D&lang=en&browser=4&usagestats=0&appname=Google%20Chrome&needsadmin=false/dl/chrome/install/googlechromestandaloneenterprise64.msi"
$pkg_filename="googlechromestandaloneenterprise64.msi"
$pkg_bin_dirs=@("bin")
$pkg_build_deps = @("guskovd/strings")

# cmd /c ... used to prevent this on win2008r2:
# Start-Process : Unable to load DLL 'api-ms-win-core-job-l2-1-0.dll': The specified module could not be found
function Invoke-Unpack {
    $script:pkg_version=$(& "$(Get-HabPackagePath strings)/bin/strings.exe" -nobanner -accepteula "$HAB_CACHE_SRC_PATH\$pkg_filename" | select-string Copyright | select-object -First 1).Line.Split(' ')[0]
    $pkg_version=$script:pkg_version
    $script:pkg_dirname="$pkg_name-$pkg_version"
    $script:pkg_prefix="$HAB_PKG_PATH/$pkg_origin/$pkg_name/$pkg_version/$pkg_release"
    $script:pkg_artifact="$HAB_CACHE_ARTIFACT_PATH/$pkg_origin-$pkg_name-$pkg_version-$pkg_release-$pkg_target.$_artifact_ext"
    cmd /c "start /wait msiexec /qn /i $HAB_CACHE_SRC_PATH\$pkg_filename"
}

function Invoke-Install {
    Copy-Item "C:\Program Files (x86)\Google\Chrome\Application\*" "$pkg_prefix/bin" -Recurse -Force
}

function Invoke-End {
    echo 'cleaning up'
    cmd /c "start /wait msiexec /qn /x $HAB_CACHE_SRC_PATH\$pkg_filename"
}

function Invoke-Verify {
    return 0
}
