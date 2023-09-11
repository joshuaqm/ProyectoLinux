#!/bin/bash

intentos=3
while [ $intentos -ge 0 ];do
    echo "Ingresa el usuario o escribe "salir" para terminar el programa"
    read -e user
    if [ "$user" == "salir" ]; then
        exit 1
    fi

    echo Ingresa la contraseña
    read -e password

    usuarioRegistrado=0
    usuarioRegistrado=$(sudo grep -r $user /etc/shadow)

    #echo $usuarioRegistrado

    if [ $usuarioRegistrado != 0 ]; then
        echo Usuario encontrado
        intentos=0
    else
        echo Usuario no encontrado
        echo "Por favor, intentalo de nuevo te quedan $intentos intentos"
    fi


    intentos=$((intentos-1))
done




