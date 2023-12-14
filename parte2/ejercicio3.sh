#!/bin/bash

lineas=$(cat palabras.txt | wc -l )
alea=$(($RANDOM%$lineas+1))
palabra=$(cat palabras.txt | head -n$alea | tail -n1)


longi=${#palabra}
alre=$(echo $palabra | rev)
vocales=$palabra

if [[ "$palabra" != "$alre" ]]; then

	echo "No es un palíndromo"

else
	echo "Es un palíndromo"
fi


for i in a e i o u ;do 

	vocales=${vocales//"$i"/""}

done

pacom=${#palabra}
pasin=${#vocales}
numvoca=$(($pacom-$pasin))
echo "La palabra es $palabra"
echo "el número de vocales es $numvoca"

