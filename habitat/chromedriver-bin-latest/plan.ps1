. ../chromedriver-bin/plan.ps1

$pkg_version="_set_from_git_"

function Invoke-Before {
    $pkg_version=$(Invoke-Webrequest https://chromedriver.storage.googleapis.com/LATEST_RELEASE).content
    $script:pkg_version=$pkg_version
    $script:pkg_source="http://chromedriver.storage.googleapis.com/$pkg_version/chromedriver_win32.zip"
    $script:pkg_prefix="$HAB_PKG_PATH\${pkg_origin}\${pkg_name}\${pkg_version}\${pkg_release}"
    $script:pkg_dirname="$pkg_name-$pkg_version"
    $script:pkg_filename="chromedriver_$pkg_version_win32.zip"
    $script:pkg_artifact="$HAB_CACHE_ARTIFACT_PATH/$pkg_origin-$pkg_name-$pkg_version-$pkg_release-$pkg_target.$_artifact_ext"
}

function Invoke-Verify {
    return 0
}

