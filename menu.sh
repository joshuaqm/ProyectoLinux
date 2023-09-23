#!/bin/bash
# Función para manejar la señal SIGINT (Ctrl+C)
ctrl_c_handler() {
    echo "Ctrl+C desactivado"
}

# Asociar la función al manejo de la señal SIGINT
trap ctrl_c_handler SIGINT
echo -e "\n \nValida"
echo -e "Bienvenid@ \e[33m"$USER"\e[0m"

opcion=""

while [ "$opcion" != "salir" ];do
    echo -e "\n\e[32mBienvenido al menu de opciones, escribe "ayuda" para ver las opciones disponibles\e[0m"
    echo -e -n "\e[33m"$USER"\e[0m:\e[36m"$PWD"\e[0m> "
    read opcion

    if [ "$opcion" == "ayuda" ];then
        echo ayuda:    Muestra la lista de comandos disponibles en la terminal PREBE
        echo infosys:  Muestra la informacion del sistema
        echo fyh:      Muestra la fecha y hora actual
        echo buscar:   Busca un archivo en la carpeta especificada por el usuario
        echo creditos: Muestra los creditos de los programadores
        echo juego:    Inicia un juego en la terminal
        echo musica:   Reproduce musica en la terminal
        echo salir:    Redirige al usuario al sistema de login
    fi

    if [ "$opcion" == "infosys" ];then
        echo "La informacion del sistema es:"
        ./infosys.sh
    fi

    if [ "$opcion" == "fyh" ];then
        echo "La fecha y hora actual es:"
        ./fechayhora.sh
    fi

    if [ "$opcion" == "buscar" ];then
        ./buscar.sh
    fi
    
    if [ "$opcion" == "creditos" ];then
        ./creditos.sh
    fi

    if [ "$opcion" == "juego" ];then
        ./juego.sh
    fi

    if [ "$opcion" == "musica" ];then
        ./musica.sh
    else
        eval $opcion 2>/dev/null
    fi

done