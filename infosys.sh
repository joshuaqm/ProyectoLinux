#!/bin/bash
echo "-------------------------------------------------------------------------"
echo "|			Información del sistema				|"
echo "-------------------------------------------------------------------------"
echo "|Nombre del dispositivo:     | $(uname -n)				|"
echo "-------------------------------------------------------------------------"
echo "|Arquitectura:               | $(uname -p)					|"
echo "-------------------------------------------------------------------------"
echo "|Sistema Operativo:          | $(uname -o)				|"
echo '-------------------------------------------------------------------------'
echo "|Versión del OS:  	     | $(grep -oP 'VERSION="\K[^"]+' /etc/os-release)		|"
echo "--------------------------------------------------------------------------"

echo "-----------------------------------------------------------------------------------------------------------"
echo "|Memoria Total | Memoria Usada | Memoria Libre | Intercambio Total | Intercambio Usado | Intercambio Libre|"
echo "-----------------------------------------------------------------------------------------------------------"

# Ejecutar el comando free -h y mostrar los resultados en la tabla
free -h | awk 'NR==2 {printf "|    %s     |     %s     |     %s     |", $2, $3, $4} NR==3 {printf "       %s       |       %s       |       %s      |\n", $2, $3, $4}'
echo "-----------------------------------------------------------------------------------------------------------"
