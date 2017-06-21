pkg_origin=endocode
pkg_name=jenkins
pkg_version=2.46.1
pkg_maintainer="Endocode Habitat Team <habitat@endocode.com>"
pkg_license=('mit')
pkg_upstream_url=https://jenkins.io/
pkg_source=http://mirrors.jenkins.io/war-stable/${pkg_version}/${pkg_name}.war
pkg_shasum="33a3f4d983c6188a332291e1d974afa0a2ee96a0ae3cb6dd4f2098086525f9f1"
pkg_deps=(core/jdk8)
pkg_svc_user="root"

do_unpack() {
    return 0
}

do_build() {
    return 0
}

do_install() {
    cp ${HAB_CACHE_SRC_PATH}/${pkg_filename} ${pkg_prefix}/jenkins.war
}
