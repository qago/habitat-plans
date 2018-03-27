function rebuild ($path, $env) {
    . ./$path/plan.ps1
    $env:HAB_NOCOLORING=true
    hab sup unload $pkg_origin/$pkg_name
    hab studio build -R -w $path
    $last_build_env = $(Get-Content $path/results/last_build.env)
    $pkg_artifact = $($last_build_env | Select-String pkg_artifact).Line.split('=')[1]
    $pkg_ident = $($last_build_env | Select-String pkg_ident).Line.split('=')[1]
    hab pkg install $path/results/$pkg_artifact
    hab sup load $pkg_ident --group $env
}
function rebuild_sensitive ($path, $env) {
    . ./$path/plan.ps1
    If (-Not $(hab pkg path $pkg_origin/$pkg_name/$pkg_version)) {
        rebuild $path $env
    }
}
