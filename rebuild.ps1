function rebuild {
    Param
    (
        [string] $Group,
	[string] $Dir,
        [string] $Env,
        [string] $App,
        [string] $Peer
    )
    . ./$Dir/plan.ps1
    $env:HAB_NOCOLORING=true
    hab sup unload $pkg_origin/$pkg_name
    hab config apply -p $Peer "$App.$Env#$pkg_name.$Group" $(get-date -f MMddyyyyHHmmss) ./$Dir/env/$App.$Env.toml
    hab studio build -R -w $Dir
    $last_build_env = $(Get-Content $Dir/results/last_build.env)
    $pkg_artifact = $($last_build_env | Select-String pkg_artifact).Line.split('=')[1]
    $pkg_ident = $($last_build_env | Select-String pkg_ident).Line.split('=')[1]
    hab pkg install $Dir/results/$pkg_artifact
    hab sup load $pkg_ident -a $App -e $Env --group $Group
}

function rebuild_sensitive ($path) {
    . ./$path/plan.ps1
    If (-Not $(hab pkg path $pkg_origin/$pkg_name/$pkg_version)) {
        rebuild $path
    }
}

function Get-Something
{
    Param
    (
         [string] $Name,
         [string] $Id
    )
echo $Name
echo $Id
}
