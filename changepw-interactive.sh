#!/bin/bash
#author: Viral Makwana
#Purpose: Simple script to add user if it doesnt exist and set pw

HOST=$(hostname)

echo "Please tell me your user name, then press [ENTER]: "
read -re user

if $(grep "$user" /etc/passwd > /dev/null 2>&1); then 
	echo "$user already exists on $HOST, to reset the password, just run: 
	passwd "$user""
exit 1
	else echo "$user does not exist on $HOST, would you like to add this user [y/n]: "
	read -rse adduser
if [ "$adduser" == "y" ]; then
	useradd -m $user
elif [ "$adduser" == "n" ]; then
	echo "Ok I will not create $user"
exit 2	
fi

echo  "Adding password for $user, Please type in your password, then press [ENTER]: "

read -rs password
if [ -n $password ]; then
	echo "$password" | passwd --stdin $user
else
	echo "no password supplied, please double check"
	exit 3
fi
fi
