#!/bin/bash
# Función para manejar la señal SIGINT (Ctrl+C)
ctrl_c_handler() {
    echo "Ctrl+C desactivado"
}

# Asociar la función al manejo de la señal SIGINT
trap ctrl_c_handler SIGINT

#/dev/null hace que no se imprima la ruta, 2>&1 descarta mensaje de error
if which mpg123 > /dev/null 2>&1;then
    echo mpg123 instalado
else
    echo -e "\nParece que no tienes instalado mpg123, ¿Quieres instalarlo? (s/n)"
    read respuesta
    if [ "$respuesta" == "s" ];then
        sudo apt-get install mpg123
    else
        echo -e "\nNo se instalo mpg123, no se puede reproducir musica\n"
        exit 1
    fi
fi

opcion=""

echo -e "\n¡Bienvenid@ a Espotifai!\n Escribe 'ayuda' para ver los comandos disponibles\n"
while [ "$opcion" != "salir" ];do
    echo -e -n "\n>"
    read opcion

    if [ "$opcion" == "ayuda" ];then
        echo ayuda:        Muestra la lista de comandos disponibles en el reproductor Espotifai
        echo reproducir:   Reproduce la cancion especificada
        echo todo:         Reproduce todas las canciones de la carpeta especificada
        echo salir:        Regresa al menu principal
    fi

    if [ "$opcion" == "reproducir" ];then
        echo -e "\n\nEscribe la ruta absoluta del directorio donde se encuentran tus canciones"
        read directorio

        echo -e "\n\nEscribe el nombre del archivo que quieres reproducir"
        read archivo

        echo -e "\nPresiona 'q' para dejar de reproducir"

        mpg123 "$directorio"/"$archivo"

    fi

    if [ "$opcion" == "todo" ];then
        echo -e "\n\nEscribe la ruta absoluta del directorio donde se encuentran tus canciones"
        read directorio

        echo -e "\nPresiona 'q' para dejar de reproducir"
        echo -e "\nPresiona 'f' para reproducir la siguiente cancion"
        echo -e "\nPresiona 'd' para reproducir la cancion anterior"

        for archivo in "$directorio"/*;do
            mpg123 "$archivo"
        done

        

    fi

done