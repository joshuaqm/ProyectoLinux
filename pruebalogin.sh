#!/bin/bash

echo "Ingresa el nombre del usuario:";
read user
echo "Ingresa la contraseña del usuario:";
read -s pass #ocultamos la contraseña por seguridad

echo $pass | su $user -c ./pruebalogin2.sh; #si la contraseña o usuario no son correctas el comando su fallará



