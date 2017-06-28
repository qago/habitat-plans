$pkg_name="google-chrome"
$pkg_origin="qago"
$pkg_version=If ($env:HAB_QAGO_GOOGLE_CHROME_PKG_VERSION) {$env:HAB_QAGO_GOOGLE_CHROME_PKG_VERSION} Else {$null}
$pkg_license=@("LGPL")
$pkg_upstream_url="http://www.google.com/chrome"
$pkg_description="Google Chrome web browser"
$pkg_maintainer="QAGO Maintainers"
$pkg_source=If ($env:HAB_QAGO_GOOGLE_CHROME_PKG_SOURCE) {
    $env:HAB_QAGO_GOOGLE_CHROME_PKG_SOURCE
} Else {
    "https://dl-ssl.google.com/tag/s/appguid=%7B00000000-0000-0000-0000-000000000000%7D&iid=%7B00000000-0000-0000-0000-000000000000%7D&lang=en&browser=4&usagestats=0&appname=Google%20Chrome&needsadmin=false/dl/chrome/install/googlechromestandaloneenterprise64.msi"
}
$pkg_shasum="5b847edee6f7823d673dac4ad8208a8f33f6c714d6ba2c18b9a00b5f22000f1e"
$pkg_filename="googlechromestandaloneenterprise64.msi"
$pkg_bin_dirs=@("bin")
$pkg_build_deps = @("qago/strings")

function Invoke-Unpack {
    If (!$pkg_version) {
	$script:pkg_version=$(& "$(Get-HabPackagePath strings)/bin/strings.exe" -nobanner "$HAB_CACHE_SRC_PATH\$pkg_filename" | select-string Copyright | select-object -First 1).Line.Split(' ')[0]
	$script:pkg_dirname="$pkg_name-$pkg_version"
	$script:pkg_prefix="$HAB_PKG_PATH/$pkg_origin/$pkg_name/$pkg_version/$pkg_release"
	$script:pkg_artifact="$HAB_CACHE_ARTIFACT_PATH/$pkg_origin-$pkg_name-$pkg_version-$pkg_release-$pkg_target.$_artifact_ext"
    }
    Start-Process "msiexec.exe" -Wait -ArgumentList "/qn","/i","$HAB_CACHE_SRC_PATH\$pkg_filename"
}

function Invoke-Verify { }

function Invoke-Install {
    Copy-Item "C:\Program Files (x86)\Google\Chrome\Application\*" "$pkg_prefix/bin" -Recurse -Force
}

function Invoke-End {
    echo 'cleaning up'
    Start-Process "msiexec.exe" -Wait -ArgumentList "/qn","/x","$HAB_CACHE_SRC_PATH\$pkg_filename"
}
