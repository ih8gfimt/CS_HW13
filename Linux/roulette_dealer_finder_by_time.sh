#!/bin/bash
# this script is for finding Routtle dealer working schedule and Routtle dealer first & last name
# command ex: ./roulette_dealer_finder_by_time.sh '0310' '05:00:00 AM'
display_usage() {
	echo "Usage: /roulette_dealer_finder_by_time.sh '0310' '05:00:00 AM'"
        }

if [  $# -le 1 ] 
	then 
	display_usage
	exit 1
fi 

echo "   Time           Name      " 
echo "-----------  ---------------" 
# to handle time format with AM/PM 
new1="$(cut -d " " -f 1 <<< $2)"
new2="$(cut -d " " -f 2 <<< $2)"
newtime="$new1.*$new2"
# print the Routtle dealer schedule and name
grep -e $newtime $1_Dealer_schedule | awk -F " " '{print $1, $2, " ", $5, $6}'
