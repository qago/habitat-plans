param (
    [string]$driver = $null,
    [string]$browser = $null
)

$geckodriver_pkg = "qago/geckodriver/$driver"
$firefox_pkg = "qago/firefox/$browser"

$geckodriver_path = $(Resolve-Path($(hab pkg path $geckodriver_pkg))).Path
$firefox_path = $(Resolve-Path($(hab pkg path $firefox_pkg))).Path

$env:PATH += ";$firefox_path\core;$geckodriver_path\bin"
$env:HEADLESS_DRIVER="$geckodriver_path\bin\geckodriver.exe"

$driver_pid = Start-Process -NoNewWindow -PassThru geckodriver.exe -ArgumentList $args
$current_pid = Get-Process -Id $pid

echo $current_pid.Id
echo $current_pid.Parent.Id

$current_pid.Parent.waitforexit()

echo 'parent done'
echo 'terminating driver pid by childs'

c:/Windows/system32/taskkill.exe /F /PID $driver_pid.Id
