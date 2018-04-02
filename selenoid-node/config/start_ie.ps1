param (
    [string]$driver = $null,
    [string]$browser = $null,
    [string]$port = $null
)

$iedriver_pkg = "qago/iedriver/$driver"

echo $iedriver_pkg

$pkg_deps=@(
    "qago/headless-selenium-for-win"
    $iedriver_pkg
)

$envLib = @{LIB=@(); PATH=@(); INCLUDE=@()}
    
Foreach ($pkg in $pkg_deps) {
    hab pkg path $pkg
    if (-Not $(hab pkg env $pkg)) {
	hab pkg install $pkg -c unstable
    }
    Foreach ($env_var in @("PATH", "LIB", "INCLUDE")) {
	$env_var_entry = $(hab pkg env $pkg | Select-String "$env_var=")
	If ($env_var_entry) {
	    $env_value = $env_var_entry.Line.split("=")[1].Replace('"', '')
	    $envLib[$env_var] += $(Resolve-Path($env_value)).Path
	}
    }
}

$iedriver_path = $(Resolve-Path($(hab pkg path $iedriver_pkg))).Path

$env:PATH = [String]::Join(";", $envLib['PATH'])
$env:LIB = [String]::Join(";", $envLib['LIB'])
$env:INCLUDE = [String]::Join(";", $envLib['INCLUDE'])

$env:HEADLESS_DRIVER="$iedriver_path\bin\IEDriverServer.exe"

headless_ie_selenium.exe --port $args