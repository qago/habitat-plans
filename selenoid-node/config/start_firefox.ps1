param (
    [string]$driver = $null,
    [string]$browser = $null
)

$browser = $browser -replace 'w',''
$geckodriver_pkg = "qago/geckodriver/$driver"

$pkg_deps=@(
    "qago/headless-selenium-for-win"
    "qago/firefox/$browser"
    "qago/geckodriver/$driver"
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

$geckodriver_path = $(Resolve-Path($(hab pkg path $geckodriver_pkg))).Path

$env:PATH = [String]::Join(";", $envLib['PATH'])
$env:LIB = [String]::Join(";", $envLib['LIB'])
$env:INCLUDE = [String]::Join(";", $envLib['INCLUDE'])

$env:HEADLESS_DRIVER="$geckodriver_path\bin\geckodriver.exe"

$driver_pid = Start-Process -NoNewWindow -PassThru geckodriver.exe -ArgumentList $args
$current_pid = Get-Process -Id $pid

echo $current_pid.Id
echo $current_pid.Parent.Id

$current_pid.Parent.waitforexit()

echo 'parent done'
echo 'terminating driver pid by childs'

c:/Windows/system32/taskkill.exe /F /PID $driver_pid.Id

