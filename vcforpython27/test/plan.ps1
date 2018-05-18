$pkg_name="vcforpython27-test"
$pkg_origin="qago"
$pkg_version="1.0.9"
# 
$pkg_hab_shell_interpreter = "pwsh"

$pkg_deps=@(
    "qago/python2/2.7.14",
    "core/powershell/6.0.0/20180124123643",
    "qago/git",
    "qago/vcforpython27/1.0/20180518144607"
)

function Invoke-Shell {
    If (-Not $(Test-Path "integration/.venv")) {
	python -m pip install virtualenv
	python -m virtualenv integration/.venv
    }
    . integration/.venv/scripts/activate.ps1
}

function Invoke-Setup {
    python -m pip install python-keystoneclient
}

function Invoke-AvTests {
    Invoke-Setup
}

function _install-dependency($dependency) {
    If (-Not $(hab pkg path $dependency)) {
	if (!$env:NO_INSTALL_DEPS) {
	    & $HAB_BIN install -u $env:HAB_BLDR_URL --channel $env:HAB_BLDR_CHANNEL $dependency
	    if ($LASTEXITCODE -ne 0 -and ($env:HAB_BLDR_URL -ne $FALLBACK_CHANNEL)) {
		Write-BuildLine "Trying to install '$dependency' from '$FALLBACK_CHANNEL'"
		& $HAB_BIN install -u $env:HAB_BLDR_URL --channel $FALLBACK_CHANNEL $dependency
	    }
	}
    }
}

