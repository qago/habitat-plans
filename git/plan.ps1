$pkg_name="git"
$pkg_origin="qago"
$pkg_version="2.13.1"
$pkg_license=@("LGPL")
$pkg_upstream_url="https://git-scm.com"
$pkg_description="Git"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="https://github.com/git-for-windows/git/releases/download/v$pkg_version.windows.2/PortableGit-$pkg_version.2-64-bit.7z.exe"
$pkg_shasum="2c98f6cab688d585d68896c8954e4849c70b33a34f8b5b6009d2ba56ddd95c43"
$pkg_filename="PortableGit-$pkg_version.2-64-bit.7z.exe"
$pkg_bin_dirs=@("bin")
$pkg_lib_dirs=@("lib")
$pkg_build_deps = @("core/7zip")

function Invoke-Unpack {
    & "$(Get-HabPackagePath 7zip)/bin/7z.exe" x "$HAB_CACHE_SRC_PATH/$pkg_filename" -O"$HAB_CACHE_SRC_PATH/$pkg_dirname"
}

function Invoke-Install {
    Copy-Item * "$pkg_prefix" -Recurse -Force
}
