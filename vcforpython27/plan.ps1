$pkg_name="vcforpython27"
$pkg_origin="qago"
$pkg_version="1.0"
$pkg_license=@("LGPL")
$pkg_upstream_url="https://www.microsoft.com/en-us/download/confirmation.aspx?id=44266"
$pkg_description="Microsoft Visual C++ Compiler for Python 2.7"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="https://download.microsoft.com/download/7/9/6/796EF2E4-801B-4FC4-AB28-B59FBF6D907B/VCForPython27.msi"
$pkg_shasum="070474db76a2e625513a5835df4595df9324d820f9cc97eab2a596dcbc2f5cbf"
$pkg_filename="VCForPython27.msi"
$pkg_build_deps=@("core/lessmsi")
$pkg_deps=@("core/hab", "core/powershell")

$pkg_bin_dirs=@(".", "VC\bin\amd64", "WinSDK\Bin\x64")
$pkg_lib_dirs=@("VC\lib\amd64", "WinSDK\Lib\x64")
$pkg_include_dirs=@("VC\include", "WinSDK\Include")

# from http://pywavelets.readthedocs.io/en/latest/dev/preparing_windows_build_environment.html
function Invoke-SetupEnvironment {
    Set-RuntimeEnv "MSSdk" 1
    Set-RuntimeEnv "DISTUTILS_USE_SDK" 1
}

function Invoke-Unpack {
    lessmsi x (Resolve-Path "$HAB_CACHE_SRC_PATH/$pkg_filename").Path
    Move-Item "VCForPython27\SourceDir\Microsoft\Visual C++ for Python\9.0" $HAB_CACHE_SRC_PATH/$pkg_dirname
}

function Invoke-Install {
    Copy-Item * "$pkg_prefix" -Recurse -Force
}

function _install-dependency($dependency) {
    If (-Not $(hab pkg path $dependency)) {
	if (!$env:NO_INSTALL_DEPS) {
	    & $HAB_BIN install -u $env:HAB_BLDR_URL --channel $env:HAB_BLDR_CHANNEL $dependency
	    if ($LASTEXITCODE -ne 0 -and ($env:HAB_BLDR_URL -ne $FALLBACK_CHANNEL)) {
		Write-BuildLine "Trying to install '$dependency' from '$FALLBACK_CHANNEL'"
		& $HAB_BIN install -u $env:HAB_BLDR_URL --channel $FALLBACK_CHANNEL $dependency
	    }
	}
    }
}

