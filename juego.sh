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

# Funcion que dibuja al ahorcado
dibujar_ahorcado() {
    case $1 in
        5)
            echo -e "  O"
            ;;
        4)
            echo -e "  O"
            echo -e "  I"
            ;;
        3)
            echo -e "  O"
            echo -e "--I"
            ;;
        2)
            echo -e "  O"
            echo -e "--I--"
            ;;
        1)
            echo -e "  O"
            echo -e "--I--"
            echo -e " i"
            ;;
        0)
            echo -e "  O"
            echo -e "--I--"
            echo -e " i i"
            ;;
        *)
            echo "Número de intentos no válido: $1"
            ;;
    esac
}

for ((i=0; i<${#palabra_secreta}; i++)); do
    palabra_adivinada+="_"
done

# Bucle que contabiliza intentos e imprime el dibujo del ahorcado
while [ $intentos -gt 0 ]; do
    mostrar_juego

    read -p "Ingresa una letra: " letra
    echo -e "\n"

    if [[ $palabra_secreta == *"$letra"* ]]; then
        for ((i=0; i<${#palabra_secreta}; i++)); do
            if [ "${palabra_secreta:i:1}" == "$letra" ]; then
                palabra_adivinada="${palabra_adivinada:0:$i}$letra${palabra_adivinada:$i+1}"
            fi
        done
        
        dibujar_ahorcado $intentos
        
    else
        intentos=$((intentos-1))
        dibujar_ahorcado $intentos
    fi

    if [ "$palabra_adivinada" == "$palabra_secreta" ]; then
        mostrar_juego
        echo "¡Felicidades! Adivinaste la palabra: $palabra_secreta"
        exit 0
    fi
done

mostrar_juego
echo "Te quedaste sin intentos. La palabra era: $palabra_secreta"

  
