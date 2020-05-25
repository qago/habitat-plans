. ../selenoid-s3-bin/plan.sh
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
    pkg_version=$(get_latest_release "qago/habitat-plans")
    pkg_source=https://dl.bintray.com/rocketb/GOQA_PACKAGES/selenoid_s3_linux_amd64
    pkg_artifact="$HAB_CACHE_ARTIFACT_PATH/${pkg_origin}-${pkg_name}-${pkg_version}-${pkg_release}-${pkg_target}.${_artifact_ext}"
    pkg_dirname="$pkg_name-$pkg_version"
    pkg_prefix=$HAB_PKG_PATH/${pkg_origin}/${pkg_name}/${pkg_version}/${pkg_release}
}
