#!/bin/bash

#atrapa a señal Ctrl-C y Ctrl-Z
trap "" SIGNIT QUIT TSTP
trap '' 2 20

#limpia pantalla
printf "\033c"	
cont=0
while [ "$file" != 'salir' ] && [ $cont != 3 ]; do  #Ingreso a la orebeshell
		echo -e -n "\033[40m\033[1;32m Ingrese usuario: \033[0m"  #Obtener datos para logeo
		read usu  
		echo -e -n "\033[40m\033[33m Ingrese contraseña: \033[0m" #-n para quitar salto y -e para permitir colores
		read -s contra

		cadena=`echo "$contra" | sudo -S grep -r "$usu" /etc/shadow`

	if [ ${cadena} > 5 ];then #comrueba i el usuario existe

		a=`grep mkpasswd /usu/bin/mkpasswd`
		if [ $a != "Binary file /usu/bin/mkpasswd matches" ];then
				echo "$contra" | sudo -S  apt-get install whois #Instala el modulo o lo reinstala dado el caso
		fi


		line='$' read -r -a array <<< "$cadena"  
		if [ ${array[1]} == 1 ];then
			encrypt="md5"
		elif [ ${array[1]} == 2 ];then
			encrypt="Blowfish"
		elif [ ${array[1]} == "2a" ];then
		    encrypt="eksblowfish"         #Determinamos que tipo de cifrado usar.
		elif [ ${array[1]} == 5 ];then
			encrypt="sha-256"
		elif [ ${array[1]} == 6 ];then
			encrypt="sha-512"
		fi
		pass=`mkpasswd --method=$encrypt --salt=${array[2]} $contra` #Detemrinamos el tipo de cifrado y el salt.
		IFS=":"
		final=$usu$IFS$pass #Contraseña.	


		if [[ $cadena == *$final* ]];then  #Validación final de contraseña
			#Menú de entrada
			promt="#"
			printf "\033c" #clear
			echo -e -n "\033[40m\033[1;36m ██████╗ ██╗███████╗███╗   ██╗██╗   ██╗███████╗███╗   ██╗██╗██████╗  ██████╗  \033[0m\n"
			echo -e -n "\033[40m\033[1;34m ██╔══██╗██║██╔════╝████╗  ██║██║   ██║██╔════╝████╗  ██║██║██╔══██╗██╔═══██╗ \033[0m\n"
			echo -e -n "\033[40m\033[1;35m ██████╔╝██║█████╗  ██╔██╗ ██║██║   ██║█████╗  ██╔██╗ ██║██║██║  ██║██║   ██║ \033[0m\n"
			echo -e -n "\033[40m\033[1;33m ██╔══██╗██║██╔══╝  ██║╚██╗██║╚██╗ ██╔╝██╔══╝  ██║╚██╗██║██║██║  ██║██║   ██║ \033[0m\n"
			echo -e -n "\033[40m\033[1;31m ██████╔╝██║███████╗██║ ╚████║ ╚████╔╝ ███████╗██║ ╚████║██║██████╔╝╚██████╔╝ \033[0m\n"
			echo -e -n "\033[40m\033[1;32m ╚═════╝ ╚═╝╚══════╝╚═╝  ╚═══╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝╚═╝╚═════╝  ╚═════╝  \033[0m\n"
			echo
			echo -e -n "\e[5m\033[40m\033[1;36m\n\t********************************************\033[0m"
			echo -e -n "\e[5m\033[40m\033[1;36m\n\t* Presione cualquier tecla cuando lo desee *\033[0m" 
			echo -e -n "\e[5m\033[40m\033[1;36m\n\t********************************************\033[0m"
			echo -e "\033[00m"   #preiona una tecla para iniciar o espera 5 segundos
			read -n1 -t5 

			printf "\033c"

			while [ "$file"  != 'salir' ];do #Comandos a ingresar
			
				echo  -e -n "\033[1;35m$usu@$usu\e[96m$PWD$promt \033[00m"  
				read  file

				case $file in
					"ayuda" )
						printf "\033c"
						$PWD/ayuda.sh
						;;
					"clear" )
						printf "\033c"
						;;
					"infosis" )
						printf "\033c"
						$PWD/infsis.sh
						;;
					"buscar" )
						printf "\033c"
						$PWD/buscar.sh
						;;
					"jugar" )
						printf "\033c"
						$PWD/jugar.sh
						;;
					"prebeplayer" )
						printf "\033c"
						$PWD/prebeplayer.sh
						;;	
					"creditos" )
						printf "\033c"
						$PWD/creditos.sh
						;;
					"arbol" )
						printf "\033c"
						$PWD/arbol.sh
						;;
					"fecha" )
						printf "\033c"
						echo -e "\e[93m\t _           "
						echo -e "\e[93m\t(_ _ _|_  _  "
						echo -e "\e[93m\t| (-(_| )(_| "
						echo
						echo -e "\e[92m\t\t****************"
						date "+                  %Y-%m-%d%n "
						echo -e "\e[92m\t\t****************"
						echo
						;;
					"hora" )
						printf "\033c"
						echo -e "\e[93m\t|_  _  _ _ "
						echo -e "\e[93m\t| |(_)| (_|"
						echo
						echo -e "\e[92m\t\t**************"
						date "+                  %H:%M:%S "
						echo -e "\e[92m\t\t**************"
						echo
						;;
					"salir" )
						exit 1
						;;
					*)
						echo -e "\033[31m Opción incorrecta, escribe ayuda \033[00m"
						;;
				esac
					
			done
		else
			echo -e "\033[31mVerifique los datos\033[00m"
			read -n1 -t5 
			let cont=$cont+1
		#Para cuando el usuario se equivoca, envía mensaje de error e incrementa el contador
		fi
		else
			echo -e "\033[31mVerifique los datos\033[00m"
			read -n1 -t5 
			let cont=$cont+1
	fi
done