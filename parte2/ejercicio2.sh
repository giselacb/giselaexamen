#!/bin/bash
function fibo() {

	if [ $alea -ne 0 ];then
		n1=$(($n1+$n2))
		echo $n1
		n2=$(($n1+$n2))
		echo $n2
		alea=$(($alea-2))
		fibo
	else
		exit
	fi
}

n1=0
n2=1

alea=$(($RANDOM%16))
alea=$(($alea+5))

fibo
