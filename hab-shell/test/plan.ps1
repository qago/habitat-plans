$pkg_name="hab-shell-test"
$pkg_origin="qago"
$pkg_version="1.0.5"
$pkg_deps=@(
    "qago/python/3.4.4",
    "core/powershell/6.0.0/20180124123643",
    "qago/git",
    "qago/google-chrome"
)
$pkg_maintainer="QAGO Maintainers"

$pkg_hab_shell_interpreter="pwsh"

function Invoke-Shell {
    If (-Not $(Test-Path "integration/.venv")) {
	python -m pip install virtualenv
	python -m virtualenv integration/.venv
    }
    . integration/.venv/scripts/activate.ps1
    # pip install -r requirements.txt
}
