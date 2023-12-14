function crearentre() {
	read -p "Dame el nombre: " nom
	if [ $nom -ne 0 ] && [[ "$userx" == "root" ]]; then
		sudo useradd -g entrenadores -d /home/$nom $nom 
		echo "El director añadió a $nom $(DATE)" >> ediciones.log 

		creanrentre

	elif [ $nom -ne 0 ] && [ $grupoen -ge 1 ];then
		read -p "Dime su equipo: " equipo
		read -p "Dime su primera valoración: " va1
		read -p "Dime su segunda valoración: " va2
		read -p "Dime su tercera valoración: " va3

		sudo useradd -g jugadores -d /home/$equipo/$nom -c "$va1,$va2,$va3" $nom

		echo "El $userx añadió a $nom $(DATE) con el equipo $nom" >> ediciones.log 

		creanrentre
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
			echo "El director visualizó a los jugadores $(DATE)" >> ediciones.log 

		;;
		e)
			echo "Los entrenadores son $(cat /etc/passwd | grep $iden | cut -d ":" -f1)"
			echo "El director visualizó a los entrenadores $(DATE)" >> ediciones.log 

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
			echo "El $userx visualizó a los jugadores $(DATE)" >> ediciones.log 

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
			echo "El $userx visualizó a la valoración de $valonom $(DATE)" >> ediciones.log 

		;;
		share)
			numero="00"
			read -p "Dime el fichero que deseas compartir: " fiche
			read -p "Dime el nombre del jugador con el que quieres compartir: " nomjuga
			read -p "Dime su equipo: " equi
			read -p "Dime si quieres que tenga lectura y escritura (6) o solo lectura (4): " permisos
			sudo find $HOME -name "$fiche.txt" -exec cp {} /home/$equi/$nomjuga \; && sudo chown $nomjuga $fiche && chmod $permisos$numero /home/$equi/$nomjuga/$fiche.txt


			echo "El $userx compartió $fiche con $nomjuga del equipo $equi $(DATE)" >> ediciones.log 			
	esac


elif [ $grupoju -ge 1 ]; then
	read -p "¿Qué quieres hacer? Ver tus valoraciones (seev), ver la media de tus valoraciones (media), ver/editar ficheros en los que tienes permisos (edit)" hacer
	case $hacer in
		seev)
			valora=$(cat /etc/passwd | grep -w $userx | cut -d ":" -f5)
			echo "Tus valoraciones son $valora"
			echo "El $userx visualizó sus valoraciones $(DATE)" >> ediciones.log 


		;;

		media)
			v1=$(cat /etc/passwd | grep -w $userx | cut -d ":" -f5 | cut -d "," -f1)
			v2=$(cat /etc/passwd | grep -w $userx | cut -d ":" -f5 | cut -d "," -f2)
			v3=$(cat /etc/passwd | grep -w $userx | cut -d ":" -f5 | cut -d "," -f3)
			resul=$(($v1+$v2+$v3))
			medi=$(($resul/3))
			echo "Tu media es de $medi"
			echo "El $userx vio su medioa $(DATE)" >> ediciones.log 

		;;
		edit)
			read -p "Dime el fichero que quieres editar o ver: " fichedi
			read -p "Dime si quieres verlo (v) o editarlo (e): " hace
			if [ -r $fiche ] && [[ "$hace" == "v" ]]; then
				cat $fichedi
			elif [ -w $fiche ] && [[ "$hace" == "e" ]]; then
				nano $fiche
			fi

			echo "$userx editó o vió el fichero $fichedi $(DATE)" >> ediciones.log 

	esac

fi
