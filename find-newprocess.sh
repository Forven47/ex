#!/bin/bash
#usage:watch -n 0.5 ./find-newprocess.sh

t=$(date '+%H:%M:%S');
a=$(ps -eo user,pid,start,tty,cmd | grep $t | grep -v "$0" | grep -E -v 'grep|tty');
if [ -n "$a" ];
then echo $a >> newprocess.txt;
fi
