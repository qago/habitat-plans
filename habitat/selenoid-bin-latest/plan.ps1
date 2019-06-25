. ../selenoid-bin/plan.ps1
. ../build-scripts/functions.ps1

$pkg_version="_set_from_git_"

function Invoke-Before {
    $script:pkg_version=getLatestRelease("aerokube/selenoid")
    $script:pkg_source="https://github.com/aerokube/selenoid/releases/download/$pkg_version/selenoid_windows_amd64.exe"
    $script:pkg_prefix="$HAB_PKG_PATH\${pkg_origin}\${pkg_name}\${pkg_version}\${pkg_release}"
    $script:pkg_dirname="$pkg_name-$pkg_version"
    $script:pkg_artifact="$HAB_CACHE_ARTIFACT_PATH/$pkg_origin-$pkg_name-$pkg_version-$pkg_release-$pkg_target.$_artifact_ext"
}


function Invoke-Verify {
    return 0
}
