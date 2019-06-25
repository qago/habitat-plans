pkg_name=chromedriver-bin
pkg_origin=qago
pkg_version=2.42
pkg_license="LGPL"
pkg_upstream_url="http://chromedriver.storage.googleapis.com"
pkg_description="chromedriver"
pkg_maintainer="Danil Guskov"
pkg_source="http://chromedriver.storage.googleapis.com/${pkg_version}/chromedriver_linux64.zip"
pkg_shasum="ced920ea978a658d915a960ed7bff62c37c9b7d62dfabbb42ffd7fe7cef7f082"
pkg_bin_dirs=(bin)

do_build() {
    return 0
}

do_install () {
    cp $HAB_CACHE_SRC_PATH/chromedriver $pkg_prefix/bin/chromedriver
    chmod '+x' $pkg_prefix/bin/chromedriver
}
