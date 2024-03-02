#!/bin/bash

cd $(dirname $(realpath $0))

if [ -f .master-layout ]; then
		hyprctl keyword general:layout dwindle
		hyprctl keyword source ./binds/bind-dwindle.conf
		rm .master-layout
else
		hyprctl keyword general:layout master
		hyprctl keyword source ./binds/bind-master.conf
		touch .master-layout
fi
