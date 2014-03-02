#!/usr/local/bin/zsh
# Used in my tmux status line for uptime and load averages

echo `uptime | awk '{ print $3, $4, $10, $11, $12 }' | sed "s/,/ | /"`
