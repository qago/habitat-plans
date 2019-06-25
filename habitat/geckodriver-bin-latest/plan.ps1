. ../geckodriver-bin/plan.ps1
. ../build-scripts/functions.ps1

$pkg_version="_set_from_git_"

function Invoke-Before {
    $tag=getLatestRelease("mozilla/geckodriver")
    $pkg_version=$tag.Substring(1, $tag.Length-1) # strip first v symbol, e.g v0.23.0
    $script:pkg_version=$pkg_version
    $script:pkg_source="https://github.com/mozilla/geckodriver/releases/download/v$pkg_version/geckodriver-v$pkg_version-win64.zip"
    $script:pkg_prefix="$HAB_PKG_PATH\${pkg_origin}\${pkg_name}\${pkg_version}\${pkg_release}"
    $script:pkg_dirname="$pkg_name-$pkg_version"
    $script:pkg_artifact="$HAB_CACHE_ARTIFACT_PATH/$pkg_origin-$pkg_name-$pkg_version-$pkg_release-$pkg_target.$_artifact_ext"
}


function Invoke-Verify {
    return 0
}
