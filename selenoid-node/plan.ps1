$pkg_name="selenoid-node"
$pkg_origin="qago"
$pkg_license=@("LGPL")
$pkg_description="selenoid windows node"
$pkg_maintainer="QAGO Maintainers"
$pkg_version="1.0.1"
$pkg_deps=@("qago/selenoid/1.6.0")

$pkg_exports=@{
  settings="settings"
}

function Invoke-Download { }
function Invoke-Verify { }
