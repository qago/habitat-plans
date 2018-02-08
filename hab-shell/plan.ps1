$pkg_name="hab-shell"
$pkg_origin="qago"
$pkg_license=@("LGPL")
$pkg_description="hab-shell"
$pkg_maintainer="QAGO Maintainers"
$pkg_source="_no_pkg_source_"
$pkg_version="1.0"
$pkg_deps=@("core/powershell")
$pkg_bin_dirs=@("bin")

function Invoke-Download { }
function Invoke-Verify { }

function Invoke-Install {
    cp $PLAN_CONTEXT/bin/hab-shell.ps1 $pkg_prefix/bin -Recurse -Force
    cp $PLAN_CONTEXT/bin/hab-shell.bat $pkg_prefix/bin -Recurse -Force
}
