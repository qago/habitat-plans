param (
    [string]$driver = $null,
    [string]$browser = $null,
    [string]$script = $null
)

& pwsh $script -browser $browser -driver $driver $args
