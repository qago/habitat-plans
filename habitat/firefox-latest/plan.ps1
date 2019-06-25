. ../firefox/plan.ps1

$pkg_version="_set_from_git_"

function Invoke-Before {
    $absoluteUri = $([System.Net.HttpWebRequest]::Create("https://download.mozilla.org/?product=firefox-latest&os=win&lang=en-US").GetResponse().ResponseUri.AbsoluteUri)
    $script:pkg_version="$($absoluteUri.split('/')[6])"
    $script:pkg_source="http://download.mozilla.org/?product=firefox-$pkg_version&os=win&lang=en-US"
    $script:pkg_prefix="$HAB_PKG_PATH\${pkg_origin}\${pkg_name}\${pkg_version}\${pkg_release}"
    $script:pkg_dirname="$pkg_name-$pkg_version"
    $script:pkg_artifact="$HAB_CACHE_ARTIFACT_PATH/$pkg_origin-$pkg_name-$pkg_version-$pkg_release-$pkg_target.$_artifact_ext"
}

function Invoke-Verify {
    return 0
}
