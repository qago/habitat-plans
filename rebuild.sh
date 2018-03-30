#!/usr/bin/env sh
# -*- coding: utf-8 -*-

set -e

function rebuild() {
    while (( "$#" )); do
	case "$1" in
	    -g|--group)
		GROUP="$2"
		shift 2
		;;
	    -d|--dir)
		DIR="$2"
		shift 2
		;;
	    -e|--env)
		ENV="$2"
		shift 2
		;;
	    -a|--app)
		APP="$2"
		shift 2
		;;
	    -p|--peer)
		PEER="$2"
		shift 2
		;;
	    --) # end argument parsing
		shift
		break
		;;
	    -*|--*=) # unsupported flags
	    echo "Error: Unsupported flag $1" >&2
	    exit 1
	    ;;
	esac
    done
    . $DIR/plan.sh
    hab sup unload $pkg_origin/$pkg_name
    hab config apply -p $PEER "$APP.$ENV#$pkg_name.$GROUP" $(date +%s) $DIR/env/$APP.$ENV.toml
    hab studio build -R $DIR
    . ./results/last_build.env
    hab pkg install ./results/$pkg_artifact
    hab sup load $pkg_ident -a $APP -e $ENV --group $GROUP
}
