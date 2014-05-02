#!/usr/bin/env zsh

UPTIME=`uptime | grep -PZo "(?<=up )[^,]*"`

echo $UPTIME
