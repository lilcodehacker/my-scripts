#!/bin/bash
function goto
{
    label=$1
    cmd=$(sed -n "/$label:/{:a;n;p;ba};" "$0" | grep -v ':$')
    eval "$cmd"
    exit
}
#start:
DATE=2026-7-4
if [ "$DATE" = "" ]; then
echo What date to countdown to \(YYYY-MM-DD\)
read DATE
printf '%s\n' H 10i "DATE=$DATE" . w | ed -s ./Scripts/daysuntil.sh
goto start
elif [ "$1" = --help ]; then
echo "Usage: ~/Scripts/daysuntil.sh [-c]"
echo "       ~/Scripts/daysuntil.sh [-fs]"
echo "       ~/Scripts/daysuntil.sh [--help]"
echo "-c --clear        clear the current date"
echo "-fs --fresh-start clear the current date and set a new one"
echo "--help            show this help"
exit
elif [ "$1" = --clear ]; then
sed -e '10d' ./Scripts/daysuntil.sh > temp && mv -f ./temp ./Scripts/daysuntil.sh
chmod +x ./Scripts/daysuntil.sh
exit
elif [ "$1" = -c ]; then
sed -e '10d' ./Scripts/daysuntil.sh > temp && mv -f ./temp ./Scripts/daysuntil.sh
chmod +x ./Scripts/daysuntil.sh
exit
elif [ "$1" = --fresh-start ]; then
sed -e '10d' ./Scripts/daysuntil.sh > temp && mv -f ./temp ./Scripts/daysuntil.sh
chmod +x ./Scripts/daysuntil.sh
echo What date to countdown to \(YYYY-MM-DD\)
read DATE
printf '%s\n' H 10i "DATE=$DATE" . w | ed -s ./Scripts/daysuntil.sh
goto start
elif [ "$1" = --fs ]; then
sed -e '10d' ./Scripts/daysuntil.sh > temp && mv -f ./temp ./Scripts/daysuntil.sh
chmod +x ./Scripts/daysuntil.sh
echo What date to countdown to \(YYYY-MM-DD\)
read DATE
printf '%s\n' H 10i "DATE=$DATE" . w | ed -s ./Scripts/daysuntil.sh
goto start
elif [ "$1" = -fs ]; then
sed -e '10d' ./Scripts/daysuntil.sh > temp && mv -f ./temp ./Scripts/daysuntil.sh
chmod +x ./Scripts/daysuntil.sh
echo What date to countdown to \(YYYY-MM-DD\)
read DATE
printf '%s\n' H 10i "DATE=$DATE" . w | ed -s ./Scripts/daysuntil.sh
goto start
fi
future=$(date -d "$DATE" "+%s")
now=$(date "+%s")
echo "$(( ( $future / 86400 ) - ( $now / 86400 ) )) days"
