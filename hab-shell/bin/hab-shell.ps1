param (
    [string]$path = $null
)

. ./plan.ps1

$envLib = @{LIB=@(); PATH=@(); INCLUDE=@()}

Foreach ($pkg in $pkg_deps) {
    if (-Not $(hab pkg env $pkg)) {
	hab pkg install $pkg
    }
    Foreach ($env_var in @("PATH", "LIB", "INCLUDE")) {
	# echo $env_var
	$env_var_entry = $(hab pkg env $pkg | Select-String "$env_var=")
	If ($env_var_entry) {
	    $env_value = $env_var_entry.Line.split("=")[1].Replace('"', '')
	    $envLib[$env_var] += $env_value
	}
    }
}

$env:PATH = [String]::Join(";", $envLib['PATH'])
$env:LIB = [String]::Join(";", $envLib['LIB'])
$env:INCLUDE = [String]::Join(";", $envLib['INCLUDE'])

Invoke-Shell
