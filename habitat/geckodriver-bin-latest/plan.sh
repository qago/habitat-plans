. ../geckodriver-bin/plan.sh
. ../build-scripts/functions.sh

pkg_version=_set_from_git_

pkg_build_deps=(
    core/curl
)

do_verify() {
    return 0
}

do_before() {
    update_pkg_version
}

update_pkg_version() {
    tag=$(get_latest_release "mozilla/geckodriver")
    pkg_version=${tag:1:${#tag}-1}
    pkg_source="https://github.com/mozilla/geckodriver/releases/download/v$pkg_version/geckodriver-v$pkg_version-linux64.tar.gz"
    pkg_artifact="$HAB_CACHE_ARTIFACT_PATH/${pkg_origin}-${pkg_name}-${pkg_version}-${pkg_release}-${pkg_target}.${_artifact_ext}"
    pkg_dirname="$pkg_name-$pkg_version"
    pkg_prefix=$HAB_PKG_PATH/${pkg_origin}/${pkg_name}/${pkg_version}/${pkg_release}
}
