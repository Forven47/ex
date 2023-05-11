#!/bin/bash
# Simple Zone Transfer Bash Script
# $1 is the first argument given after the bash script
# Check if argument was given, if not, print usage

if[ -z "$1" ]; 
then
  echo " [*] Simple Zone transfer script "
  echo " [*] Usage : $O <domain name> "
exit 0
fi

# if argument was given, identify the DNS servers for the domain

for server in $(host -t ns $1 | cut -d " " -f4); 
do
# For each of these servers, attempt a zone transfer
  host -l $1 Sserver | grep "has address"
done

#kali@kali:~S chmod +x dns-axfr.sh
#kali@kali:~S ./dns-axfrsh megacorpone.com
#admin.megacorpone.com has address 38.100.193.83
#beta.megacorpone.com has address 38.100.193.88