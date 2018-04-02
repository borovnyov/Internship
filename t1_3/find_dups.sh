#! /bin/bash

read -n 1 -p "Are you sure that you want to start it (y/[a]): " AMSURE 
[ "$AMSURE" = "y" ] || exit 
echo "" 1>&2

name="rm_dups.sh"
mode="name"

if test $2  
then
    mode=$2
fi

if test $3  
then
    name=$3
fi


#case "mode"in
# "name")
       echo '#! /bin/bash' > $name
       find $1 -type f -printf "%f\n" | sort | uniq  -d |
	   while  read line
	   do		
	       echo "####----------|${line}|-------" >> $name
	       find $1 -type f  -name "${line}" -printf "#rm %p\n" | sed -e 's/ /\\ /g' -e 's/\\ / /'1 >> $name	 
	   done 
       #	;;
       #   "cont")
       
