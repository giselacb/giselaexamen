#!/bin/bash

declare -A array

read -p "Dame el primer número: " array[1]
read -p "Dame el segundo número: " array[2]
read -p "Dame el tercero número: " array[3]

suma=0 
media=0
producto=0
mayor=0
menor=0

for i in 1 2 3 ; do

	suma=$(($suma+${array[$i]}))

	media=$(($suma/3))

	producto=$((${array[1]}*${array[2]}*${array[3]}))
done

array[suma]=$suma
array[media]=$media
array[producto]=$producto


if [ ${array[1]} -gt ${array[2]} ]; then
	mayor=${array[1]}
else
	mayor=${array[2]}
fi
if [ $mayor -gt ${array[3]} ]; then
	mayor=$mayor
else
	mayor=${array[3]}
fi

if [ ${array[1]} -lt ${array[2]} ]; then
	menor=${array[1]}
else
	menor=${array[2]}
fi
if [ $menor -lt ${array[3]} ]; then
	menor=$menor
else
	menor=${array[3]}
fi
array[mayor]=$mayor
array[menor]=$menor

read -p "Dime si quieres que te muestre suma, producto, media, mayor, menor o salir: " respu

if [[ $respu != "salir" ]]; then
	echo "$respu es ${array[$respu]}"
else
	exit
fi
