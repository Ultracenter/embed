#!/bin/bash

echo "Content-type: text/html"
echo ""

echo "<html><center>"

links=$(($RANDOM % 12))

segundos=$(($RANDOM % 30))

app=`echo $0 | rev | cut -d '/' -f 1 | rev`

printf "<head><meta HTTP-EQUIV = \"Refresh\" CONTENT = \"%d; URL = %s\"></head>\n" $segundos "/cgi-bin/$app"
    
printf "<font face=sans size=4 color=darkgray><br>%d seg<br>%d fila" $segundos $links

if [ $links -gt 1 ]
then
    printf "s"
fi

printf "<br></font>\n"

((links--))

if [ $links -ge 0 ]
then

    for i in `seq 0 $links`;
    do
	printf "<embed src=/cgi-bin/rand.sh width=100px height=400px>\n"
    done
fi

echo "<br><br>"


printf "<embed src=/embed.png>\n"


echo "</center></html>"

