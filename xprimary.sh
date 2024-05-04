#!/bin/sh

MONITOR="$1"

handle() {
	case $1 in
	monitoradded* | monitorremoved*)
		xrandr --output $MONITOR --primary &&
			echo "set $MONITOR primary"
		;;
	esac
}

handle monitoradded

socat -U - UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
