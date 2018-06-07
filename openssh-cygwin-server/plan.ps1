$pkg_name="openssh-cygwin-server"
$pkg_origin="qago"
$pkg_license=@("LGPL")
$pkg_description="openssh-cygwin-server"
$pkg_maintainer="QAGO Maintainers"
$pkg_version="1.0"
$pkg_deps=@("qago/openssh-cygwin", "core/powershell", "core/hab")
$pkg_svc_user="Administrator"

function Invoke-Download { }
function Invoke-Verify { }
