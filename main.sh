#!/bin/bash

trap "" 2 20
trap "" SIGSTP #Trampas para detener las señales Ctrl-Z y Ctrl-C
printf "\033c" #limpia pantalla

intento=0


while [ "$c" != 'salir' ] && [ $intento != 3 ]; do
	ruta=$PWD
	echo -e -n "\033[40m\033[1;35m Ingresa nombre de usuario: \033[0m"
	read usr
	echo -e -n "\033[40m\033[1;35m Ingresa contraseña de usuario: \033[0m"
	read -s pswd

	cad=` echo "$pswd" | sudo -S grep -r "$usr" /etc/shadow`
	if [ ${cad} > 5 ];then #comprueba si el usuario existe

		asignapwd=`grep mkpasswd /usr/bin/mkpasswd`	
		
		if [ $asignapwd != "Binary file /usr/bin/mkpasswd matches" ];then
			echo "$pswd" | sudo -S apt-get install whois
		fi
	

	#tipo de cifrado
	IFS='$' read -r -a array <<< "$cad"
	
	if [ ${array[1]} == 1 ];then
		tencript="md5"
	elif [ ${array[1]} == 2 ];then
		tencript="Blowfish"
	elif [ ${array[1]} == "2a" ];then
		tencript="eksblowfish"
	elif [ ${array[1]}  == 5 ];then
		tencript="sha-256"
	elif [ ${array} == 6 ];then
		tencript="sha-512"
	fi
	
	con=`mkpasswd --method=$tencript --salt=${array[2]} $pswd`
	a=" : "
	final=$usr$a$con
	

	if [[ $cad == *$final* ]];then

		echo "Te quiero"

	fi
	let intento=$intento+1
fi

done


