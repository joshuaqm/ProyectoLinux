#!/bin/bash

echo "¡Bienvenid@ a ahorcado!, la palabra que tienes que adivinar es una fruta"
# Palabras para el juego
palabras=("mango" "manzana" "melon" "pera" "kiwi" "sandia" "platano")

palabra_secreta=${palabras[$RANDOM % ${#palabras[@]}]}

palabra_adivinada=""
intentos=6

# Función que muestra el estado actual del juego
mostrar_juego() {
    echo -e "\nPalabra a adivinar: $palabra_adivinada"
    echo "Intentos restantes: $intentos"
}

for ((i=0; i<${#palabra_secreta}; i++)); do
    palabra_adivinada+="_"
done

# Bucle que contabiliza intentos e imprime el dibujo del ahorcado
while [ $intentos -gt 0 ]; do
    mostrar_juego

    read -p "Ingresa una letra: " letra
    echo -e "\n"
    # Verifica si la letra está en la palabra secreta
    if [[ $palabra_secreta == *"$letra"* ]]; then
        for ((i=0; i<${#palabra_secreta}; i++)); do
            if [ "${palabra_secreta:i:1}" == "$letra" ]; then
                palabra_adivinada="${palabra_adivinada:0:$i}$letra${palabra_adivinada:$i+1}"
            fi
        done
        if [ $intentos -eq 5 ];then
            echo -e "  O"
        fi
        if [ $intentos -eq 4 ];then
            echo -e "  O"
            echo -e "  I"
        fi
        if [ $intentos -eq 3 ];then
            echo -e "  O"
            echo -e "--I"
        fi
        if [ $intentos -eq 2 ];then
            echo -e "  O"
            echo -e "--I--"
        fi
        if [ $intentos -eq 1 ];then
            echo -e "  O"
            echo -e "--I--"
            echo -e " i"
        fi
        if [ $intentos -eq 0 ];then
            echo -e "  O"
            echo -e "--I--"
            echo -e " i i"
        fi
    else
        intentos=$((intentos - 1))
        if [ $intentos -eq 5 ];then
            echo -e "  O"
        fi
        if [ $intentos -eq 4 ];then
            echo -e "  O"
            echo -e "  I"
        fi
        if [ $intentos -eq 3 ];then
            echo -e "  O"
            echo -e "--I"
        fi
        if [ $intentos -eq 2 ];then
            echo -e "  O"
            echo -e "--I--"
        fi
        if [ $intentos -eq 1 ];then
            echo -e "  O"
            echo -e "--I--"
            echo -e " i"
        fi
        if [ $intentos -eq 0 ];then
            echo -e "  O"
            echo -e "--I--"
            echo -e " i i"
        fi
    fi

    if [ "$palabra_adivinada" == "$palabra_secreta" ]; then
        mostrar_juego
        echo "¡Felicidades! Adivinaste la palabra: $palabra_secreta"
        exit 0
    fi
done

mostrar_juego
echo "Te quedaste sin intentos. La palabra era: $palabra_secreta"

  
