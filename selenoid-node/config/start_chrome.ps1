param (
    [string]$driver = $null,
    [string]$browser = $null,
    [string]$port = $null
)

$chrome_pkg = "qago/google-chrome/$browser"
$chromedriver_pkg = "qago/chromedriver/$driver"

$chrome_path = $(Resolve-Path($(hab pkg path $chrome_pkg))).Path
$chromedriver_path = $(Resolve-Path($(hab pkg path $chromedriver_pkg))).Path

$env:PATH += ";$chrome_path\bin"

New-Item -Force -Path $chrome_path\bin\chromedriver.exe -ItemType SymbolicLink -Value $chromedriver_path\bin\chromedriver.exe

$env:HEADLESS_DRIVER="$chrome_path\bin\chromedriver.exe"

# $driver_pid = Start-Process -NoNewWindow -PassThru headless_ie_selenium. -ArgumentList $args
$driver_pid = Start-Process -NoNewWindow -PassThru chromedriver.exe -ArgumentList $args

$current_pid = Get-Process -Id $pid

echo $current_pid.Id
echo $current_pid.Parent.Id

$current_pid.Parent.waitforexit()

echo 'parent done'
echo 'terminating driver pid by childs'

c:/Windows/system32/taskkill.exe /F /PID $driver_pid.Id

