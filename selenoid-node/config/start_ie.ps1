param (
    [string]$driver = $null,
    [string]$browser = $null,
    [string]$port = $null
)

$iedriver_pkg = "qago/iedriver/$driver"
echo $iedriver_pkg

$iedriver_path = $(Resolve-Path($(hab pkg path $iedriver_pkg))).Path

$env:HEADLESS_DRIVER="$iedriver_path\bin\IEDriverServer.exe"

$driver_pid = Start-Process -NoNewWindow -PassThru headless_ie_selenium.exe -ArgumentList $args
$current_pid = Get-Process -Id $pid

echo $current_pid.Id
echo $current_pid.Parent.Id

$current_pid.Parent.waitforexit()

echo 'parent done'
echo 'terminating driver pid by childs'

c:/Windows/system32/taskkill.exe /F /PID $driver_pid.Id
