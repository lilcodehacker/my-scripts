#!/bin/bash
if [ "$1" = "--test" ]; then
 if [[ "$(ps -e | grep konsole && ps | grep ssh)" = "" ]]; then
 echo "Not Running"
 exit
 else
 echo "Already Running"
 exit
 fi
fi
if [ "$1" = "-t" ]; then
 if [[ "$(ps -e | grep konsole && ps | grep ssh)" = "" ]]; then
 echo "Not Running"
 exit
 else
 echo "Already Running"
 exit
 fi
fi
if [[ "$(ps -e | grep konsole && ps | grep ssh)" = "" ]]; then
true
else
echo "Already Running"
exit
fi
LC_it=yes konsole -e "ssh messenger@retropie" &
while true
do
ps | grep konsole > /dev/null || exit
xdotool search --name messenger@retropie && xdotool search --class konsole windowunmap
xdotool search --name messenger@retropie && xdotool search --class konsole windowunmap
xdotool search --name messenger@retropie && xdotool search --class konsole windowunmap
xdotool search --name messenger@retropie && xdotool search --class konsole windowunmap
xdotool search --name messenger@retropie && xdotool search --class konsole windowunmap
xdotool search --name messenger@retropie && xdotool search --class konsole windowunmap
xdotool search --name messenger@retropie && xdotool search --class konsole windowunmap
xdotool search --name messenger@retropie && xdotool search --class konsole windowunmap && exit
done
