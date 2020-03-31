#!/bin/bash
#Realice un script que copie todos los archivos del directorio home del usuario que lo ejecuta,
#a un subdirectorio del mismo llamado backup cambiándoles el nombre para que esté
#en mayúsculas. No se deben procesar los subdirectorios del home del usuario,
#únicamente los archivos ubicados directamente en este. Si el directorio backup existe al
#iniciar el script, el contenido del mismo debe borrarse antes de copiar los archivos.

dirbackup=$HOME/backup

if [ -e $dirbackup ]; then rm -rf $dirbackup; fi
IFS=$'\n'
home_files=(`find $HOME -mindepth 1 -maxdepth 1 -type f`)

mkdir $dirbackup

for f in ${home_files[*]}
do
	filename=$(basename -- "$f")
	echo "cp $f $dirbackup/$(tr [:lower:] [:upper:] <<< "$filename")"
	cp $f $dirbackup/$(tr [:lower:] [:upper:] <<< "$filename")
done
exit 0
