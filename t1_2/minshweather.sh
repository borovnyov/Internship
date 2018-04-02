#! /bin/bash

if [ $(which wgetd) == " " ]
then
    echo "sdfa"
fi
N=$(cat config.ini)
echo $N
for((;;))
    do
TEMP=$(wget -q -O-  http://pogoda.tut.by/ | grep  fcurrent-top -A 5 | grep  temp-i | sed  's/<span class="temp-i">//; s!&deg;</span></div>!!' )

echo "Temperature="$TEMP
sleep $N
done 
