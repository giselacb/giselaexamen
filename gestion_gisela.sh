userx=$(whoami)
grupoen=$(id $userx | grep entrenadores | wc -l )
grupoju=$(id $userx | grep jugadores | wc -l )


#Los jugadores y entrenadores pertenecen al grupo jugadores o entrenadores, en caso de que las variables grupoen/ju den 1 es porque o son entrenadores o jugadores y ya se meten por su if correspondiente 
if [[ "$userx" == "root" ]]; then 

	echo "Los jugadores son

elif [ $grupoen -gt 1 ]; then


elif [ $grupoju -gt 1 ]; then
		
	

fi
