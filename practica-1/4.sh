#!/bin/bash
#
# 4. Se le ha encomendado organizar las fotos (en formato jpg) de todos los eventos de los
# que su empresa ha participado en el último año, los cuales se encuentran organizados en
# directorios con el nombre del evento. Para facilitar su búsqueda posterior, los archivos deben
# tener nombres que sigan el siguiente patrón: EVENTO-N.jpg, donde:
# EVENTO es el nombre del evento (el del directorio que se está procesando)
# N es un índice de foto, comenzando en 1
# Realice un script que renombre los archivos de cada subdirectorio del directorio actual
# siguiendo lo especificado en el párrafo anterior.
#
# Ejemplo: dada la siguiente estructura de archivos y directorios:
# 
# bashconf15/
# 	DSC01050.jpg
# 	DSC01051.jpg
# 	DSC01052.jpg
# 	DSC01053.jpg
# 	DSC01054.jpg
#
# jsconf−14/
# 	DSC01230.jpg
# 	DSC01231.jpg
# 	DSC01232.jpg
# 	DSC01235.jpg
# 	DSC01236.jpg
#
# oktoberfest−14/
# 	DSC02229.jpg
# 	DSC02230.jpg
# 	DSC02231.jpg
# 	DSC02232.jpg
#
# Se desea terminar con la siguiente estructura luego de ejecutar su script:
# bashconf15/
#	bashconf15−1.jpg
# 	bashconf15−2.jpg
# 	bashconf15−3.jpg
# 	bashconf15−4.jpg
# 	bashconf15−5.jpg
#
# jsconf−14/
# 	jsconf−14−1.jpg
# 	jsconf−14−2.jpg
# 	jsconf−14−3.jpg
# 	jsconf−14−4.jpg
# 	jsconf−14−5.jpg
#
# oktoberfest−14/
# 	oktoberfest−14−1.jpg
# 	oktoberfest−14−2.jpg
# 	oktoberfest−14−3.jpg
# 	oktoberfest−14−4.jpg
#

for dir in `find "." -mindepth 1 -type d -printf "%f\n" | sed 's/ /⻳/g'`
do
	index=1
	dirname="`echo $dir | sed 's/⻳/ /g'`"
	for file in `find "$dirname" -type f -name "*.jpg" -printf "%f\n" | sed 's/ /⻳/g' | sort`
	do
		filename="`echo $file | sed 's/⻳/ /g'`"
		echo "mv $dirname/$filename $dirname/$dirname-$index.jpg"
		mv "$dirname/$filename" "$dirname/$dirname-$index.jpg"
		index=$(($index+1))
	done
done
exit 0
