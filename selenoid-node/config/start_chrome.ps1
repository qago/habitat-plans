param (
    [string]$driver = $null,
    [string]$browser = $null,
    [string]$port = $null
)

$browser = $browser -replace 'w',''
$chrome_pkg = "qago/google-chrome/$browser"
$chromedriver_pkg = "qago/chromedriver/$driver"

$pkg_deps=@(
    "qago/headless-selenium-for-win"
    $chrome_pkg
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

$chrome_path = $(Resolve-Path($(hab pkg path $chrome_pkg))).Path
$chromedriver_path = $(Resolve-Path($(hab pkg path $chromedriver_pkg))).Path

$env:PATH = [String]::Join(";", $envLib['PATH'])
$env:LIB = [String]::Join(";", $envLib['LIB'])
$env:INCLUDE = [String]::Join(";", $envLib['INCLUDE'])

New-Item -Force -Path $chrome_path\bin\chromedriver.exe -ItemType SymbolicLink -Value $chromedriver_path\bin\chromedriver.exe

$env:HEADLESS_DRIVER="$chrome_path\bin\chromedriver.exe"

# headless_ie_selenium.exe --port $args

& $chrome_path\bin\chromedriver.exe $args
