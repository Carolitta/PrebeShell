#!/bin/bash
function cambio(){
	read ruta
	cd "$ruta"
}
printf "\033c"		#cls
while [ "$OPC" != "6" ];do
RESPUESTA=$(dpkg --get-selections | grep -w mpg123 | grep -w install)
  if [ "$RESPUESTA" = "" ]; then
      echo -e "\n\n El mpg123 no esta instalado. Deseas instalarlo ? Si o No \n\n"
      read eleccion
      case $eleccion in 
      	Si)
		`sudo apt-get install mpg123`
		echo -e "\n El mpg123 esta instalado."
		;;
		si)
		`sudo apt-get install mpg123`
		echo -e "\n El mpg123 esta instalado."
		;;
		s)
		`sudo apt-get install mpg123`
		echo -e "\n El mpg123 esta instalado."
		;;
		S)
		sudo apt-get install mpg123
		echo -e "\n El mpg123 esta instalado."
		;;
		No)
		echo -e "¡Hasta luego!"
		;;
		no)
		echo -e "¡Hasta luego!"
		;;
		N)
		echo -e "¡Hasta luego!"
		;;
		n)
		echo -e "¡Hasta luego!"
		;;
		*)
		echo -e "¡Hasta luego!"
		;;
      	esac
      
  else
      #echo "E l mpg123 YA ESTA INSTALADO"
		echo -e -n "\033[40m\033[1;36m  ██████╗ ██████╗ ███████╗██████╗ ███████╗██████╗ ██╗      █████╗ ██╗   ██╗███████╗██████╗      \033[0m\n"
		echo -e -n "\033[40m\033[1;34m  ██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔════╝██╔══██╗██║     ██╔══██╗╚██╗ ██╔╝██╔════╝██╔══██╗      \033[0m\n"
		echo -e -n "\033[40m\033[1;35m  ██████╔╝██████╔╝█████╗  ██████╔╝█████╗  ██████╔╝██║     ███████║ ╚████╔╝ █████╗  ██████╔╝      \033[0m\n"
		echo -e -n "\033[40m\033[1;33m  ██╔═══╝ ██╔══██╗██╔══╝  ██╔══██╗██╔══╝  ██╔═══╝ ██║     ██╔══██║  ╚██╔╝  ██╔══╝  ██╔══██╗  \033[0m\n"
		echo -e -n "\033[40m\033[1;31m  ██║     ██║  ██║███████╗██████╔╝███████╗██║     ███████╗██║  ██║   ██║   ███████╗██║  ██║  \033[0m\n"
		echo -e -n "\033[40m\033[1;32m  ╚═╝     ╚═╝  ╚═╝╚══════╝╚═════╝ ╚══════╝╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝ \033[0m\n"
		echo
		echo -e "\E[1;37m  Carpeta actual: `pwd`\n"
		echo -e "Seleccione la opción que desea realizar: \n "
		echo -e "\t1)Reproducir el contenido de la carpeta actual"
		echo -e "\t2)Cambiar de carpeta"
		echo -e "\t3)Subir una carpeta"
		echo -e "\t4)Listar archivos y subcarpetas de la carpeta actual"
		echo -e "\t5)Listar opciones del reproductor"
		echo -e "\t6)Salir"
	  
	  read OPC
	  
	  toca= pwd
	  case $OPC in
		  1)
			echo -e "\E[1;34m	[s] Pausa\n[f] Siguiente\n[d] Anterior\n[b] Repetir\n[.] Adelante\n[,] Atrás\n[+]Volumen Arriba\n[-] Volumen Abajo\n[q] Quitar reproducción\n[h] Listar más opciones del mpg123\n "
			`mpg123 -C -d $toca* `
			clear
			;;
		  2) 
			echo -e "\E[1;36m	Introduce la ruta a la que deseas ir: "  
			cambio 
			printf "\033c"		#cls
			clear
			;;
		  3) 
			cd ..
			clear
			;;
		  4) 
		  	printf "\033c"		#cls
			$PWD/arbol.sh
			echo -e "\E[1;35m	\nPresione una tecla para continuar..."
			read
			clear
		  	;;
		  5)
			echo -e "\E[1;33m	\nEstas son las opciones del PrebePlayer: \n[s] Pausa\n[f] Siguiente\n[d] Anterior\n[b] Repetir\n[.] Adelante\n[,] Atrás\n[+]Volumen Arriba\n[-] Volumen Abajo\n[q] Quitar reproducción\n[h] Listar más opciones del mpg123\n "  
			echo -e "\E[1;35m	\nPresione una tecla para continuar..."
			read
			clear
			;;
		  6)
			echo -e "\E[1;32m	¡HASTA LUEGO!"
		  ;;
		  *) echo -e "\E[1;31m	Opcion inválida. Intente de nuevo"
			echo -e "Presione una tecla para continuar..."
			read
			clear
			;;
	  esac
  fi
done