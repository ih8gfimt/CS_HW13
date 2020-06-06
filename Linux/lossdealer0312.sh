#!/bin/bash
# this script is for finding the loss time and Routtle dealer first & last name
# command ex: ./lossdealer0312 03/10 05:00:00 AM 
echo "   Time           Name      " >> Dealers_working_during_losses
echo "-----------  ---------------" >> Dealers_working_during_losses
echo $1 >> Dealers_working_during_losses
grep -E $2.*$3 0312_Dealer_schedule  | awk -F " " '{print $1, $2, " ", $5, $6}' >> Dealers_working_during_losses
