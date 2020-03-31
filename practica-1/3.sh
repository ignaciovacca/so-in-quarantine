#!/bin/bash
# 3. Desarrolle un script que guarde en un arreglo todos los archivos del directorio actual (in-
# cluyendo sus subdirectorios) para los cuales el usuario que ejecuta el script tiene permisos
# de ejecución. Luego, implemente las siguientes funciones:
# 	(a) cantidad: Imprime la cantidad de archivos que se encontraron
#	(b) archivos: Imprime los nombres de los archivos encontrados en orden alfabético

files=()

IFS=$'\n'
for file in `find $PWD -type f -executable`
do
	files=(${files[*]} $file)
done

function cantidad() {
	echo "Cantidad de archivos: ${#files[@]}"
}

function archivos() {
	echo "Archivos en orden alfabetico "
	for a in "${files[@]}";do echo "$a";done | sort
}

echo "Directorio actual: $PWD"
cantidad
archivos

exit 0
