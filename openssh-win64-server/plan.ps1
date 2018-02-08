$pkg_name="openssh-win64-server"
$pkg_origin="qago"
$pkg_license=@("LGPL")
$pkg_description="openssh-win64-server"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="_no_pkg_source_"
$pkg_version="1.0"
$pkg_deps=@("qago/openssh-win64")

function Invoke-Download { }
function Invoke-Verify { }
function Invoke-Install {
    echo hello
}
