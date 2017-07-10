$pkg_name="deps-sample"
$pkg_origin="qago"
$pkg_version="1.0"
$pkg_license=@("LGPL")
$pkg_upstream_url="https://github.com/aerokube/selenoid"
$pkg_description="selenoid chrome node"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="_no_pkg_source_"
$pkg_deps=@("qago/chromedriver")
$pkg_bin_dirs=@("bin")

function Invoke-Download { }

function Set-PackageVersion {
}

function Invoke-Install {
    # ls "$(Get-HabPackagePath 'google-chrome')/bin"
    # ls $(Get-HabPackagePath "chromedriver")/bin
    # Copy-Item "$(Get-HabPackagePath 'google-chrome')/bin" "$pkg_prefix" -Recurse -Force
    mkdir bin
    # Copy-Item "$(Get-HabPackagePath 'chromedriver')/bin" "$pkg_prefix" -Recurse -Force
    cmd /c mklink bin\chromedriver.exe "$(Get-HabPackagePath 'chromedriver')\bin\chromedriver.exe"
}

function Invoke-Verify { }
