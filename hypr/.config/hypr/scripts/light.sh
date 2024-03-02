#!/bin/bash


function toggle {
	if [ "$(light -G)" = '0.00' ]; then
		light -I
	else
		light -O
		light -S 0.00
	fi
}


br_up() {
	light -A $1
}

br_down() {
	light -U $1
}


while [ $# -gt 0 ]; do
	case $1 in
		t|toggle)
			shift
			toggle $1
			shift
			;;
		u|up)
			shift
			br_up $1
			shift
			;;
		d|down)
			shift
			br_down $1
			shift
			;;
		*)
			shift
			;;
	esac
done
