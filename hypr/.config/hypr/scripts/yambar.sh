#!/bin/bash


all_pids=$(pgrep yambar)
pids=""
for pid in $all_pids; do
	[ $pid != $$ ] && pids+="$pid "
done

if [ $pids ]; then
	kill $pids
else
	(yambar &)
fi

