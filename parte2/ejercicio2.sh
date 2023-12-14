#!/bin/bash
#Esta versión no la hice en el examen, es la versión anterior la que hice (que da problemas), 
#esta es que salí del instituto y mientras iba para mi casa vi que no iba a funcionar bien la otra y la he corregido

function fibo() {

	if [ $alea -ne 0 ];then

		n2=$(($n1+$n2))
		echo $n2
		alea=$(($alea-1))

	else
		exit
	fi
	if [ $alea -ne 0 ]; then
		n1=$(($n1+$n2))
		echo $n1
		alea=$(($alea-1))
		fibo
	else 
		exit
	fi
}

n1=0
n2=1

alea=$(($RANDOM%16))
alea=$(($alea+5))

echo "alea es $alea"

fibo
