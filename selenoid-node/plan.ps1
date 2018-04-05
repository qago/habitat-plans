$pkg_name="selenoid-node"
$pkg_origin="qago"
$pkg_license=@("LGPL")
$pkg_description="selenoid windows node"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="_no_pkg_source_"
$pkg_version="1.0.1"
$pkg_deps=@("qago/selenoid")

$pkg_exports=@{
  settings="settings"
}

function Invoke-Download { }
function Invoke-Verify { }
