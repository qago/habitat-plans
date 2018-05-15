Param (
    [alias("c")][string]$command = $null,
    [alias("d")][string]$directory = $PWD,
    [alias("s")][string]$sanbox = $null
)

$HAB_SHELL_PLAN="./plan.ps1"

function UpSearch($f) {
    if (Test-Path "$f") {
	return "$directory"
    }
    else {
	$parent=$PWD
	cd ..
	if ("$directory" -eq "$parent") {
	    return 1
	}
	UpSearch $f
    }
}

$PLAN_PS1_DIRECTORY=$(UpSearch $HAB_SHELL_PLAN)
pushd $PLAN_PS1_DIRECTORY

mkdir -p .hab-shell/windows -ErrorAction SilentlyContinue
cp plan.ps1 .hab-shell/windows

pushd .hab-shell/windows

. ./plan.ps1

$plan_pkg_origin=$pkg_origin
$plan_pkg_version=$pkg_version

if (-Not $(Test-Path("./results/last_build.env"))) {
    hab studio build -w -R .
}

$last_build_env = $(Get-Content "./results/last_build.env")
$pkg_artifact = $($last_build_env | Select-String pkg_artifact).Line.split('=')[1]
$pkg_ident = $($last_build_env | Select-String pkg_ident).Line.split('=')[1]
$pkg_version = $($last_build_env | Select-String pkg_version).Line.split('=')[1]

If (-Not ("$pkg_version" -eq "$plan_pkg_version")) {
    hab studio build -w -R .
    $last_build_env = $(Get-Content "./results/last_build.env")
    $pkg_artifact = $($last_build_env | Select-String pkg_artifact).Line.split('=')[1]
    $pkg_ident = $($last_build_env | Select-String pkg_ident).Line.split('=')[1]
    $pkg_version = $($last_build_env | Select-String pkg_version).Line.split('=')[1]
}

If (-Not $(& hab pkg path $pkg_ident)) {
    hab pkg install results/$pkg_artifact
}

popd
popd

$HAB_SHELL_FULL_CMD = ". ./plan.ps1; Invoke-Shell"

if ($command) {
    $HAB_SHELL_FULL_CMD = "$HAB_SHELL_FULL_CMD; $command"
    hab pkg exec $pkg_ident $pkg_hab_shell_interpreter -c "$HAB_SHELL_FULL_CMD"
}
else {
    hab pkg exec $pkg_ident $pkg_hab_shell_interpreter -NoExit -c "$HAB_SHELL_FULL_CMD"
}
