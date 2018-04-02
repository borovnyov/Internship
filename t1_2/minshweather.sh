#! /bin/bash

N=$(cat config.ini) #set N at config.ini file

read -n 1 -p "Are you sure that you want to start it (y/[a]): " AMSURE 
[ "$AMSURE" = "y" ] || exit 
echo "" 1>&2

if ! test $(which wget)  
then
    echo "wget not installed"
elif ! test $(which grep)
then
    echo "grep not installed"
elif ! test $(which sed)
then
    echo "sed  not installed"
else
    for((;;))
   do
       TEMP=$(wget -q -O-  http://pogoda.tut.by/ | grep  fcurrent-top -A 5 | grep  temp-i | sed  's/<span class="temp-i">//; s!&deg;</span></div>!!' )
       echo "Temperature="$TEMP \(Ctrl-C to stop\)
       sleep $N
done 

fi


