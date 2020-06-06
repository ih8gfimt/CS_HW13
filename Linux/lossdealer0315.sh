#!/bin/bash
# this script is for finding the loss time and Routtle dealer first & last name
# command ex: ./lossdealer0315 03/10 05:00:00 AM 
echo "   Time           Name      " >> Dealers_working_during_losses
echo "-----------  ---------------" >> Dealers_working_during_losses
echo $1 >> Dealers_working_during_losses
grep -E $2.*$3 0315_Dealer_schedule  | awk -F " " '{print $1, $2, " ", $5, $6}' >> Dealers_working_during_losses
