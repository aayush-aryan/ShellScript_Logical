#!/bin/bash
read -p "Enter the number of trials : " t
getFlipCoin(){
   number=$1
   if (( $number == 0 ))
	then
   value=H
   else
   value=T
   fi
   echo $value
}
value="$( getFlipCoin $((RANDOM%2)) )"
echo outComes of getFlipCoin functons : $value
declare -A SingletDict
for (( i=0; i<$t; i++ ))
do
   value="$( getFlipCoin $((RANDOM%2)) )"
   SingletDict[$value]=$((${SingletDict[$value]}+1))
done
echo Singlet combination ${!SingletDict[@]}
echo Singlet count ${SingletDict[@]}
for key in "${!SingletDict[@]}";
   do
      percentage=`expr "scale=2;${SingletDict[$key]}*100/10" | bc`
      echo Percentage of $key $percentage
   done
declare -A doubletDict
for (( i=0; i<$t; i++ ))
do
   value1="$( getFlipCoin $((RANDOM%2)) )"
   value2="$( getFlipCoin $((RANDOM%2)) )"
   doubletDict[$value1$value2]=$((${doubletDict[$value1$value2]}+1))
done
echo Doublet combination ${!doubletDict[@]}
echo Doublet count ${doublettoss[@]}
for key in "${!doubletDict[@]}";
do
      percentage=`expr "scale=2;${doubletDict[$key]}*100/10" | bc`
      echo Percentage of $key $percentage
done
declare -A trippletDict
for (( i=0; i<$t; i++ ))
do
   value1="$( getFlipCoin $((RANDOM%2)) )"
  value2="$( getFlipCoin $((RANDOM%2)) )"
  value3="$( getFlipCoin $((RANDOM%2)) )"
  trippletDict[$value1$value2$value3]=$((${trippletDict[$value1$value2$value3]}+1))
done
echo tripplet combination ${!trippletDict[@]}
echo tripplet count ${trippletDict[@]}
for key in "${!trippletDict[@]}"
do
    percentage=`expr "scale=2;${trippletDict[$key]}*100/10" | bc`
      echo Percentage of $key $percentage
done
sortedValue=($(
    for key in "${!trippletDict[@]}";
    do
      printf '%s:%s\n' "$key" "${trippletdict[$key]}"
    done | sort -t : -k 2n))
echo sorted trippletDict ${sortedValue[@]}
sortedValue=($(
    for key in "${!doubletDict[@]}";
     do
      printf '%s:%s\n' "$key" "${doubletDict[$key]}"
    done | sort -t : -k 2n))
echo sorted doublettoss ${sortedValue[@]}
sortedValue=($(
    for key in "${!SingletDict[@]}"; do
      printf '%s:%s\n' "$key" "${SingletDict[$key]}"
done | sort -t : -k 2n))
