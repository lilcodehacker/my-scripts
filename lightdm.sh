#!/bin/bash
status=$(w -h | awk '{print $1}' | grep lightdm)
mtty=$(w | grep -n arc | awk '{print $2}')
while true
do
guest=$(w -h | awk '{print $1}' | grep guest)
tty=$(w | grep -n guest | awk '{print $2}')
mtty=$(w | grep -n arc | awk '{print $2}')
status=$(w -h | awk '{print $1}' | grep lightdm)
 if [ "$status" = "" ]; then
  sleep 5
  if [ "$(echo $guest)" = "" ]; then
   dm-tool switch-to-greeter   
   sleep 4
   sudo chvt ${mtty#tty}
   sudo chvt ${mtty#tty}
   sudo chvt ${mtty#tty}
   sudo chvt ${mtty#tty}
   sudo chvt ${mtty#tty}
   sudo chvt ${mtty#tty}
   sudo chvt ${mtty#tty}
   sudo chvt ${mtty#tty}
   sudo chvt ${mtty#tty}
   loginctl unlock-session $(loginctl | grep arc | awk '{print $1}') 
  else
   sudo chvt ${tty#tty}
   sudo chvt ${tty#tty}
   sudo chvt ${tty#tty}
   sudo chvt ${tty#tty}
   sudo chvt ${tty#tty}
   sudo chvt ${tty#tty}
   sudo chvt ${tty#tty}
   sudo chvt ${tty#tty}
  fi
 fi
done 
