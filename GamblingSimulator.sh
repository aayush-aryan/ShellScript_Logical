#!/bin/bash 
echo "WELCOME TO GAMBLING SIMULATOR :"

#Declaring constant term:
initialStake=100
numberOfDays=30
win=1
loss=0
BET=1
IS_VALID=true
lastLossAmount=0

#declaring variables:
stakePercentAmount=$(( 50*$initialStake/100 ))
maxwin=$(( $stakePercentAmount+$initialStake ))
maxloss=$(( $initialStake-$stakePercentAmount ))
totalwinOrloss=0
dayswin=0
daysloss=0

declare -A dayChart
declare -A monthChart

function dailyBetting()
{
   dayStake=$initialStake
   while [ $dayStake -lt $maxwin ] && [ $dayStake -gt $maxloss ]
   do
     rem=$(( RANDOM % 2 ))
     if [ $rem -eq 1 ]
     then
        dayStake=$(( $dayStake+$BET ))
     else
        dayStake=$(( $dayStake-$BET ))
     fi
   done
}

function monthBetting(){

   for (( day=1; day<=$numberOfDays; day++ ))
   do
   dailyBetting
      if [ $dayStake -eq $maxloss ]
      then
         totalwinOrloss=$(( $totalwinOrloss - $stakePercentAmount ))
         dayChart["Day $day"]=-$stakePercentAmount
         monthChart["Day $day"]=$totalwinOrloss
         ((daysloss++))
      else
         totalwinOrloss=$(( $totalwinOrloss + $stakePercentAmount ))
         dayChart["Day $day"]=$stakePercentAmount
         monthChart["Day $day"]=$totalwinOrloss
         ((dayswin++))
      fi
   done
 
   echo "Total Won/loss : $totalwinOrloss"
   echo "No. of days win $dayswin by $(($dayswin*$stakePercentAmount))" 
   echo "No. of days loss $daysloss by  $(($daysloss*$stakePercentAmount))"
   echo "${!monthChart[@]} : ${monthChart[@]}"

   luckyDay=$( printf "%s\n" ${monthChart[@]} | sort -nr | head -1 )
   unluckyDay=$( printf "%s\n" ${monthChart[@]} | sort -nr | tail -1 )

   for data in "${!monthChart[@]}"
   do
      if [[ ${monthChart[$data]} -eq $luckyDay ]]
      then
         echo "LUCKIEST DAY- $data $luckyDay"
      elif [[ ${monthChart[$data]} -eq $unluckyDay ]]
      then
         echo "UNLUCKIEST DAY- $data $unluckyDay"
      fi
   done
}

#main
while [ $IS_VALID ]
do
   monthBetting
   if [ $totalwinOrloss -lt $lastLossAmount ]
   then
      echo "you lost, can't paly"
      break
   else
      echo "you won $totalwinOrloss, continue playing"
   fi
done
