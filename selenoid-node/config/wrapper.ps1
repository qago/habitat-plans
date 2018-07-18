param (
    [string]$driver = $null,
    [string]$browser = $null,
    [string]$script = $null
)

& pwsh $script -browser $browser -driver $driver $args 2>&1 > C:/hab/svc/selenoid-node/data/session$args.log
