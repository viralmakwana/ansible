#!/bin/bash
#author: Viral Makwana
#Purpose: Simple script to add password for user, or create user/w password. Prompts for user input via read.

HOST=$(hostname)

echo "Please tell me your user name, then press [ENTER]: "
read -rse user

if [ id -u "$user" &> /dev/null] ; then echo "$user does exist, lets continue....";
	else echo "$user does not exist on $HOST, would you like to add this user [y/n]: "
	read -rse adduser
if [ "$adduser" == "y" ]; then
	useradd -m $user
elif [ "$adduser" == "n" ]; then
	echo "Ok I will not create $user"
exit 500	
fi

echo  "Adding password for $user, Please type in your password, then press [ENTER]: "

read -r password
if [ -n $password ]; then
	echo "$password" | passwd --stdin $user
else
	echo "no password supplied, please double check"
	exit 501
fi
fi
