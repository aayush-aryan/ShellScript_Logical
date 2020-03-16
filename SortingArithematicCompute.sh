#!/bin/bash -x
#-------Arithmetic Computation------
declare -A computation
function arithmeticCompute(){
local a=$1
local b=$2
local c=$3
compute1=$(($a+$b*$c))
compute2=$(($a*$b+$c))
compute3=$(($c+$a/$b))
compute4=$(($a%$b+$c))
computation[0]=$compute1
computation[1]=$compute2
computation[2]=$compute3
computation[3]=$compute4
echo ${computation[@]}
Ascenting=($(echo ${computation[@]} | tr " " "\n" | sort -n ))
Descenting=($(echo ${computation[@]} | tr " " "\n" | sort -nr ))
echo "Ascending order Computation is ${Ascenting[@]}"
echo "Decending order Computation is ${Descenting[@]}"
}

read -p "Enter the value a :" a
read -p "Enter the value b :" b
read -p "Enter the value c :" c
arithmeticCompute $a $b $c
