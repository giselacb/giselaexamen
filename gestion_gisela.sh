function crearentre() {
	read -p "Dame el nombre: " nom
	if [ $nom -ne 0 ] && [["$userx" == "root]] ;then
		read -p "Dame la primera valoración del jugador: " va1
		read -p "Dame la segunda valoración del jugador: " va2
		read -p "Dame la tercera valoración del jugador: " va3
		sudo useradd -g entrenadores -d /home/$nom -c "$va1,$va2,$va3" $nom 
	
		creanrentre
	elif [ $nom -ne 0 ] && [ $grupoen -ge 1 ] ;then
		sudo useradd -g jugadores -d /home/$nom $nom
		creanrentr
	fi 
	
}

userx=$(whoami)
grupoen=$(id $userx | grep entrenadores | wc -l )
grupoju=$(id $userx | grep jugadores | wc -l )
idju=$(cat /etc/group | grep jugadores | cut -d ":" -f3)
iden=$(cat /etc/group | grep entrenadores | cut -d ":" -f3)

#Los jugadores y entrenadores pertenecen al grupo jugadores o entrenadores, en caso de que las variables grupoen/ju den 1 es porque o son entrenadores o jugadores y ya se meten por su if correspondiente 
if [[ "$userx" == "root" ]]; then 
	read -p "¿Qué quieres hacer? visualizar jugadores (j), visualizar entrenadores (e), añadir entrenadores (adden)" hacer
	case $hacer in 

		j)
			echo "Los jugadores son $(cat /etc/passwd | grep $idju | cut -d ":" -f1)"

		;;
		e)
			echo "Los entrenadores son $(cat /etc/passwd | grep $iden | cut -d ":" -f1)"

		;;
		adden)
			read -p "Si quieres crear jugadores pon 1: parará cuando pongas 0 " respu

			if [ $respu -eq 1 ]; then
				crearentre
			fi

		esac
elif [ $grupoen -ge 1 ]; then
	read -p "¿Qué quieres hacer? visualizar jugadores (j), añadir jugador (addju), visualizar valoraciones de un jugador (visu), compartir fichero con jugadores de un equipo (share)" hacer

	case $hacer in
		j)
			echo "Los jugadores son $(cat /etc/passwd | grep $idju | cut -d ":" -f1)"

		;;

		addju)
			read -p "Si quieres crear jugadores pon 1: parará cuando pongas 0 " respu
			if [ $respu -eq 1 ]; then
				crearentre
			fi
		;;
		visu)
			read -p "Dime el nombre del jugador del cual quieres ver las valoraciones: " valonom
			valora=$(cat /etc/passwd | grep -w $valonom | cut -d ":" -f5)
			echo "Las valoraciones de $valonom son $valora"
		;;
		share)
	esac
		
		

elif [ $grupoju -ge 1 ]; then

	read -p "¿Qué quieres hacer? Ver tus valoraciones (seev), ver la media de tus valoraciones (media), ver/editar ficheros en los que tienes permisos (edit)" hacer

	case $hacer in
		seev)
			valora=$(cat /etc/passwd | grep -w $userx | cut -d ":" -f5)
			echo "Tus valoraciones son $valora"

		;;

		media)
			v1=$(cat /etc/passwd | grep -w $userx | cut -d ":" -f5 | cut -d "," -f1)
			v2=$(cat /etc/passwd | grep -w $userx | cut -d ":" -f5 | cut -d "," -f2)
			v3=$(cat /etc/passwd | grep -w $userx | cut -d ":" -f5 | cut -d "," -f3)
			resul=$(($v1+$v2+$v3))
			medi=$(($resul/3))
			echo "Tu media es de $medi"
		;;
		edit)
			
		esac

fi
