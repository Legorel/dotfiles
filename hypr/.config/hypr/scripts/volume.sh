#!/bin/bash


function toggle-mute-speaker {
	wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

	wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep MUTED
	if [ $? -eq 0 ]; then
		dunstify -u normal -r 2 'Default audio speaker muted'
	else
		dunstify -u normal -r 2 'Default audio speaker unmuted'
	fi
}

function toggle-mute-mic {
	wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

	wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep MUTED
	if [ $? -eq 0 ]; then
		dunstify -u normal -r 3 'Default audio mic muted'
	else
		dunstify -u normal -r 3 'Default audio mic unmuted'
	fi
}

volume-up() {
	volume=`wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed -e 's/Volume: \([0-9]*\)\.\([0-9]*\).*/\1\2/'`
	if [ $volume -gt 100 ] || [ $volume -eq 100 ]; then
		dunstify -u normal -h int:value:100 -r 4 'Volume at maximum'
		
		wpctl set-volume @DEFAULT_AUDIO_SINK@ 1.00
	else
		wpctl set-volume @DEFAULT_AUDIO_SINK@ ${1}+
		
		volume=`wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed -e 's/Volume: \([0-9]*\)\.\([0-9]*\).*/\1\2/'`
		dunstify -u normal -h int:value:"$volume" -r 4 'Volume up'
	fi

}

volume-down() {
	volume=`wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed -e 's/Volume: \([0-9]*\)\.\([0-9]*\).*/\1\2/'`
	if [ $volume -eq 0 ]; then
		dunstify -u normal -h int:value:0 -r 4 'Volume at minimum'
	else
		wpctl set-volume @DEFAULT_AUDIO_SINK@ ${1}-
		
		volume=`wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed -e 's/Volume: \([0-9]*\)\.\([0-9]*\).*/\1\2/'`
		dunstify -u normal -h int:value:"$volume" -r 4 'Volume down'
	fi
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

