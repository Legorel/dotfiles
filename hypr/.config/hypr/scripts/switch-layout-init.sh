#!/bin/bash

cd $(dirname $(realpath $0))

[ -f .master-layout ] && rm .master-layout

hyprctl keyword general:layout dwindle
hyprctl keyword source ../binds/bind-dwindle.conf
