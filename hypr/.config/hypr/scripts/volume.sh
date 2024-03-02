#!/bin/bash


function toggle-mute-speaker {
	wpctl set-mute 40 toggle
}

function toggle-mute-mic {
	wpctl set-mute 41 toggle
}

volume-up() {
	wpctl set-volume 40 ${1}+
}

volume-down() {
	wpctl set-volume 40 ${1}-
}



while [ $# -gt 0 ]; do
	case $1 in
		tms|toggle-mute-speaker)
			toggle-mute-speaker
			shift
			;;
		tmm|toggle-mute-mic)
			toggle-mute-mic
			shift
			;;
		vu|volume-up)
			shift
			volume-up $1
			shift
			;;
		vd|volume-down)
			shift
			volume-down $1
			shift
			;;
		*)
			shift
			;;
	esac
done

