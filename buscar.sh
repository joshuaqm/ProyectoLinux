#!/bin/bash

echo -e "\n\nEscribe el nombre del archivo que quieres buscar"
read archivo

echo "Escribe la ruta absoluta del directorio en el que quieres buscar"
read directorio

busqueda=$(find "$directorio" -type f -name "$archivo")
echo $busqueda

if [ "$busqueda" == "" ];then
    echo -e "\nNo se encontro el archivo\n"
else
    echo -e "\nSe encontro el archivo en la ruta especificada:"
    echo $busqueda
fi