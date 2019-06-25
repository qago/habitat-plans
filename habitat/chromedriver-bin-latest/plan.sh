. ../chromedriver-bin/plan.sh

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
    pkg_version=$(curl --silent https://chromedriver.storage.googleapis.com/LATEST_RELEASE)
    pkg_source="http://chromedriver.storage.googleapis.com/${pkg_version}/chromedriver_linux64.zip"
    pkg_artifact="$HAB_CACHE_ARTIFACT_PATH/${pkg_origin}-${pkg_name}-${pkg_version}-${pkg_release}-${pkg_target}.${_artifact_ext}"
    pkg_dirname="$pkg_name-$pkg_version"
    pkg_prefix=$HAB_PKG_PATH/${pkg_origin}/${pkg_name}/${pkg_version}/${pkg_release}
}
