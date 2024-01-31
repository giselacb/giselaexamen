# giselaexamen
PRIMERA PARTE 
Ejercicios:
Nos piden que realicemos un sistema de automatización de usuarios y ficheros, basados en script, sobre un sistema Linux, que nos permita gestionar información de una Academia de Fútbol.
El script principal se llamará gestion_tunombre.sh, el cual funcionará “distinto” según el usuario que lo ejecute. Tiene que gestionar 3 perfiles:
●	Director deportivo (tendrá perfil de root). Solo puede haber uno en el sistema.
 
Le hemos cambiado la contraseña a sudo porque debe poder loguearse 
●	Entrenador (tendrá perfil de sudo). Puede haber varios en el sistema
 
El grupo principal no va a ser sudo sino entrenadores 
●	Jugador (tendrá perfil “básico”). Puede haber varios en el sistema
 

Consideraciones adicionales:
●	Un futbolista pertenece a una única plantilla.
●	Un entrenador pertenece a una o varias plantillas, aunque su gestión en este ejercicio no va a depender de las plantillas a las que pertenezca (pero lo puedes tener en cuenta si te queda tiempo, modificándolo en otra rama)

Qué hará nuestro script principal:
●	Si entra como director deportivo, nos permitirá:
○	Visualizar entrenadores
○	Visualizar jugadores
○	Añadir entrenadores (uno a uno)
●	Si entras como entrenador, nos permitirá:
○	Visualizar jugadores
○	Añadir jugadores (uno a uno)
○	Añadir 3 valoraciones (se guardan en fichero) por jugador
○	Visualizar valoraciones de un jugador
○	“Compartir” ficheros .pdf con jugadores de un equipo concreto, en modo lectura/escritura o solo lectura.
●	Si entras como jugador, nos permitirá:
○	Ver nuestras valoraciones
○	Ver la media de nuestras valoraciones
○	Ver/Editar ficheros en los que tenemos permisos (si vas bien de tiempo, realiza esta opción desde el script, preguntando qué fichero quieres ver/editar. Si no vas bien de tiempo, compruébalo desde la línea de comandos).

IMPORTANTE!!:Todo lo que se vaya realizando con el script (cuando se utiliza el script), deberá quedar plasmado en un fichero llamado eventos_tunombre.log. Este fichero deberá subirse junto al resto de ficheros del control.

Notas:
●	Un jugador no tiene que tener los mismos permisos que otro jugador (dependerá del equipo al que pertenezcan)
Github:
●	Crea un nuevo repositorio, en tu cuenta, para el control, y sube todo el contenido generado a una branch llamada feature_controlbasico. Todo desde la línea de comandos. Indica en el control tu repositorio.

PARTE 2: 
*Ejercicio 1:*
Realizar un script que le pase por parámetro (argumentos) 3 números. Nuestro programa guardará en un
ARRAY ASOCIATIVO estos 3 números, mas la suma de los 3, la media, el producto, el mayor, el menor (lo hará
a modo de “caché”, para hacer los accesos más rápidos,
A continuación, el script me pedirá qué es lo que quiero mostrar (suma, media, producto, mayor, menor o salir).
*Ejercicio 2:*
Realizar un script que de forma aleatoria me calcule un número aleatorio del 5 al 20 y de FORMA RECURSIVA,
me calcule el fibonacci hasta esa posición (por ejemplo, si el aleatorio es el 7, me mostrará los primeros 7
números de la secuencia de fibonacci.
*Ejercicio 3:*
Script que lea de un fichero de palabras una palabra de forma “aleatoria”. De dicha palabra me:
● Dirá si es un palíndromo o no (se lee igual del derecho que del revés)
● Cuántas vocales tiene
Docker:
● Vamos a crear un docker file que consistirá en una versión de nginx. Sobre dicha versión:
○ Deberá instalarse nano
○ Copiará los scripts realizados en alguna carpeta “accesible” gracias a nginx
○ Construiremos el docker con el nombre aso_minombre:controlsh
● Arrancaremos el docker, con el puerto del servicio de nginx “mapeado” al de nuestro PC
● Desde el navegador de nuestro PC nos descargaremos los scripts realizados, que los subiremos a la
plataforma junto al pdf
