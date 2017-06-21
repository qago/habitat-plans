$pkg_name="iedriver"
$pkg_origin="qago"
$pkg_version="3.4"
$pkg_license=@("LGPL")
$pkg_upstream_url="http://www.seleniumhq.org"
$pkg_description="iedriver"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="http://selenium-release.storage.googleapis.com/$pkg_version/IEDriverServer_x64_$pkg_version.0.zip"
$pkg_shasum="f7badf5c388bcfbe191d93f8038d7808f4f67d30c63d548035d17de1e56f36f1"
$pkg_filename="IEDriverServer_x64_$pkg_version.0.zip"
$pkg_bin_dirs=@("bin")

function Invoke-Unpack {
    mkdir "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
    Expand-Archive -Path "$HAB_CACHE_SRC_PATH/$pkg_filename" -DestinationPath "$HAB_CACHE_SRC_PATH/$pkg_dirname/bin"
}

function Invoke-Install {
    Copy-Item * "$pkg_prefix" -Recurse -Force
}

function Invoke-Verify { }
