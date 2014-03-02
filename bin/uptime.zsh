#!/usr/local/bin/zsh
# note: I know this is messy but it works.

UPTIME=`uptime | sed -e "s/up//" \
  | cut -f 4-14 -d " " | sed -e "s/[0-9]*:[0-9]*,//" \
  | sed -e "s/[0-9]* users,//" | sed -e "s/   //" \
  | sed -e "s/averages://" | sed -e "s/load/ | /" \
  | sed -e "s/  //" | sed -e "s/,//"`

echo $UPTIME
