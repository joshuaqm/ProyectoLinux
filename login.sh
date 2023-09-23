#!/bin/bash
# Función para manejar la señal SIGINT (Ctrl+C)
ctrl_c_handler() {
    echo "Ctrl+C desactivado"
}

# Asociar la función al manejo de la señal SIGINT
trap ctrl_c_handler SIGINT

#Funcion que bloquea ctrl+z
stty susp ""

while true; do
    echo "Ingresa el nombre del usuario o 'salir' para salir:"
    read user

    if [ "$user" == "salir" ]; then
        echo "Gracias por usar la terminal PREBE:)"
        break 
    fi

    echo "Ingresa la contraseña del usuario:"
    read -s pass 

    if su "$user" <<EOF
$pass
EOF
    then
        ./menu.sh
    else
        echo "Credenciales incorrectas."
    fi
done
