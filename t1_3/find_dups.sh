#! /bin/bash

read -n 1 -p "Are you sure  to start  (y/[a]): " AMSURE 
[ "$AMSURE" = "y" ] || exit 
echo "" 1>&2

##    default equals of arg
target_dir="."
script_name="rm_dups.sh"
mode="name"
count=$#


while ((count))
do
    shift
    echo $1
    case "$count" in
	"1")	 
	    if [ $1 = "name" ] || [  $1 = cont ] 
	    then
		mode=$1
	    elif [ $1 = "*.sh" ]
	    then
		script_name=$1
	    elif [ $1 ]
	    then
		
		target_dir=$1
	    fi
	    ;;
	"2")
	    if [ $2 = "name" ] || [ $2 = "cont" ] 
	    then
		mode=$2
	    elif [ $2 = "*.sh" ]
	    then
		script_name=$2
	    elif [ $2 ]
	    then
		
		target_dir=$2
	    fi
	    ;;
	"3")
	    if [ $3 = "name" ] || [ $3 = "cont" ] 
	    then
		mode=$3
	    elif [ $3 = "*.sh" ]
	    then
		script_name=$3
	    elif [ $3 ]
	    then
		
		target_dir=$3
	    fi
	    ;;
    esac
    ((count--))
done
echo '#! /bin/bash' > $script_name
case "$mode" in
    "name")
	
	find $1 -type f -printf "%f\n" | sort | uniq  -d |
	    while  read line
	    do
		echo "####----------|${line}|-------" >> $script_name
		find $1 -type f  -name "${line}" -printf "#rm %p\n" |
		    sed -e 's/ /\\ /g' -e 's/\\ / /'1 >> $script_name	 
	    done 
	;;
    "cont")
	find $1 -type f -printf "%p\n" |
	    while read line
	    do
		md5sum  "${line}" >> hash_sum
	    done
	cat hash_sum |awk '{print $1}' | sort | uniq -d  |
	    while read line
	    do
		echo "####----------|$line|-------" >> $script_name 
		grep $line hash_sum | awk -F\ / '{print $2}' |  
		    while read line2
		    do			
			echo "#rm /$line2"   | sed -e 's/ /\\ /g' -e 's/\\ / /'1 >> $script_name
		    done		
	    done
	;;
esac


