Param (
    [alias("c")][string]$command = $null,
    [alias("p")][string]$plan = $null
)

if (-Not $plan) {
    $plan = "$PWD/plan.ps1"
}

if (-Not $(Test-Path("$plan"))) {
    write "Invalid path: $plan"
    exit 1
}

. $plan

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

if ($command) {
    function Invoke-ShellCommand {
	& $command
    }
}

if (Get-Command "Invoke-ShellCommand" -errorAction SilentlyContinue) {
    Invoke-ShellCommand
}
else {
    if (Get-Command "Invoke-ShellLogin" -errorAction SilentlyContinue) {
	Invoke-ShellLogin
    }
}
