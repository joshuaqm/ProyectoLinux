#!/bin/bash

echo -e "\n \nValida"
echo "Bienvenido $USER"
echo "La carpeta actual es:"
pwd

opcion=""

while [ "$opcion" != "salir" ];do
    echo -e -n "\n\nBienvenido al menu de opciones, escribe "ayuda" para ver las opciones disponibles\n>"
    read opcion

    if [ "$opcion" == "ayuda" ];then
        echo ayuda:    Muestra la lista de comandos disponibles en la terminal PREBE
        #echo infosis:  Muestra la informacion del sistema
        echo fyh:      Muestra la fecha y hora actual
        #echo buscar:   Busca un archivo y una carpeta deseados por el usuario
        echo creditos: Muestra los creditos de los programadores
        echo juego:    Inicia un juego en la terminal
        #echo musica:   Reproduce musica en la terminal
        echo salir:    Redirige al usuario al sistema de login
    fi
    if [ "$opcion" == "fyh" ];then
        echo "La fecha y hora actual es:"
        ./fechayhora.sh
    fi


    if [ "$opcion" == "salir" ];then
        echo -e "Redirigiendo al sistema de inicio de sesion...\n"
        exit 1
    fi
    if [ "$opcion" == "creditos" ];then
        ./creditos.sh
    fi
    if [ "$opcion" == "juego" ];then
        ./juego.sh
    fi
done