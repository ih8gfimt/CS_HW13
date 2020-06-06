i#!/bin/bash
# this script is for finding games dealer working schedule and game dealer first & last name
# command ex: ./roulette_dealer_finder_by_time_and_game.sh  '0310' '05:00:00 AM' 'BlackJack_Dealer_FNAME'
display_usage() {
    echo "Usage: ./rouroulette_dealer_finder_by_time_and_game.sh  '0310' '05:00:00 AM' 'BlackJack_Dealer_FNAME'"
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
# print the game dealer schedule and name
    case $3 in
        BlackJack_Dealer_FNAME)
            grep -e $newtime $1_Dealer_schedule | awk -F " " '{print $1, $2, " ", $3, $4}'
            ;;
        Roulette_Dealer_FNAME)
            grep -e $newtime $1_Dealer_schedule | awk -F " " '{print $1, $2, " ", $5, $6}'
            ;;
        Texas_Hold_EM_dealer_FNAME)
            grep -e $newtime $1_Dealer_schedule | awk -F " " '{print $1, $2, " ", $7, $8}'
            ;;
        *)
            echo "I don't understand"
    esac	    

