#!/bin/bash -x
echo ---------Welcome to SnakeLadder Game----------
Game_Winning=100
PlayerOneStarting=0
player2ndStarting=0
count1=0
count2=0
while [ $PlayerOneStarting -lt $Game_Winning ] && [ $player2ndStarting -lt $Game_Winning ]
do
	playonerolldice=$(($((RANDOM%6))+1))
	checkPlayone=$((RANDOM%3))
	if [ $checkPlayone -eq 0 ]
	then
		PlayerOneStarting=$PlayerOneStarting
	elif [ $checkPlayone -eq 1 ]
	then
		  PlayerOneStarting=$(($PlayerOneStarting+$playonerolldice))
		case $PlayerOneStarting in
				19)
				PlayerOneStarting=66
				;;
				32)
				PlayerOneStarting=53
				;;
				67)
				PlayerOneStarting=100
				;;
				73)
				PlayerOneStarting=90
				;;
		esac
	elif [ $checkPlayone -eq 2 ]
then
		 PlayerOneStarting=$PlayerOneStarting
                case $PlayerOneStarting in
                                26)
                                PlayerOneStarting=6
                                ;;
                                46)
                                PlayerOneStarting=12
                                ;;
                                74)
                                PlayerOneStarting=52
                                ;;
                esac
	fi
		playtworolldice=$(($((RANDOM%6))+1))
        checkPlaytwo=$((RANDOM%3))
	 if [ $checkPlaytwo -eq 0 ]
        then
                player2ndStarting=$player2ndStarting
        elif [ $checkPlaytwo -eq 1 ]
        then
                  player2ndStarting=$(($player2ndStarting+$playtworolldice))
                case $player2ndStarting in
                                19)
                                player2ndStarting=66
                                ;;
                                32)
                                player2ndStarting=53
                                ;;
                                67)
                                player2ndStarting=100
                                ;;
                                73)
                                player2ndStarting=90
                                ;;
                esac
        elif [ $checkPlaytwo -eq 2 ]
        then
                 player2ndStarting=$player2ndStarting
                case $player2ndStarting in
                                26)
                                player2ndStarting=6
                                ;;
                                46)
                                player2ndStarting=12
                                ;;
                                74)
                                player2ndStarting=52
                                ;;
                esac
        fi


((count1++))
((count2++))
done
if [ $PlayerOneStarting -eq $Game_Winning  ]
	then
		echo "1st player won  and number of chance is $count1"
else
		echo "2nd Player  won and number of chance is $count2"
fi
