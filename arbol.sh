printf "\033c"
echo -e -n "\033[40m\033[1;36m  ████████╗██████╗ ███████╗███████╗  \033[0m\n"
echo -e -n "\033[40m\033[1;34m  ╚══██╔══╝██╔══██╗██╔════╝██╔════╝  \033[0m\n"
echo -e -n "\033[40m\033[1;35m     ██║   ██████╔╝█████╗  █████╗    \033[0m\n"
echo -e -n "\033[40m\033[1;33m     ██║   ██╔══██╗██╔══╝  ██╔══╝   \033[0m\n"
echo -e -n "\033[40m\033[1;31m     ██║   ██║  ██║███████╗███████╗  \033[0m\n"
echo -e -n "\033[40m\033[1;32m     ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝\033[0m\n"
echo
ricerca () {

for dir in `echo *`

# `echo *` enumera todos los archivos en el directorio de trabajo actual

# sin saltos de linea, algo similar a la instruccion: for dir in *

do

    if [ -d "$dir" ] ; then     # Si se trata de un directorio (-d)

        zz=0                    # Variable temporal para registrar el nivel

                                # del directorio.

        while [ $zz != $1 ]     # Bucle para mostrar las barras verticales interiores

        do

            echo -n "| "        # Muestra el simbolo del enlace vertical

            zz=`expr $zz + 1`

        done

 

        if [ -L "$dir" ] ; then         # Si el directorio es un link simbolico (-L)

            # Mostramos el simbolo del enlace seguido del nombre del directorio

            # eliminando la parte de la fecha y hora

            echo "+---$dir" `ls -l $dir | sed 's/^.*'$dir' //'`

        else

            echo "+---$dir"             # Muestra el simbolo del enlace

 

            numdir=`expr $numdir + 1`   # Incrementa el contador del directorio

            if cd "$dir" ; then         # Si se ha podido acceder al directorio...

                ricerca `expr $1 + 1`   # llamada recursiva

                cd ..                   # volvemos al directorio anterior

            fi

        fi

    fi

done

}

 

# Si recibimos algun valor, nos movemos al directorio indicado

if [ $# != 0 ] ; then

  cd $1

fi

 

echo "Directorio inicial = `pwd`"

numdir=0

 

ricerca 0

echo "Total directorios = $numdir"

 

exit 0


