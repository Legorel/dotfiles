#!/bin/bash

br_set() {
	brightnessctl -n1 s "$1"
	level="$(brightnessctl -m -e g)"
	max="$(brightnessctl -m m)"
	(( value = 100 * level / max ))
	dunstify -u normal -h int:value:"$value" 'Changed brightness'
}

br_set "$1"
