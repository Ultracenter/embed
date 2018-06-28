#!/bin/bash

echo "Content-type: text/html"
echo ""

segundos=$(($RANDOM % 10))

app=`echo $0 | rev | cut -d '/' -f 1 | rev`

printf "<head><meta HTTP-EQUIV = \"Refresh\" CONTENT = \"%d; URL = %s\"></head>\n" $segundos "/cgi-bin/$app"

max=$(($RANDOM % 10))

if [ $max -gt 1 ]
then
    sufixo="ns"
else
    sufixo="m"
fi

echo "<font face=sans size=4 color=darkgray><br>$segundos seg<br>$max ite$sufixo<br></font><br>"

if [ $max -gt 0 ]
then
    ((max--))
    for i in `seq 0 $max`;
    do
        c=$(($RANDOM % 1000))
	echo "<font face=sans size=4 color=#$c>$c</font><br>"
    done
fi

