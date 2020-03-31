#!/bin/bash

#Escriba un script que liste en orden alfabético inverso el contenido del directorio actual. Es decir, si el contenido son los archivos:
#	archivo_1.txt articulo.doc directorio directorio_2 script.sh
#se espera que el script los liste de la siguiente manera:
#	script.sh directorio_2 directorio articulo.doc archivo_1.txt

echo `pwd | ls -r`
exit 0
