#!/bin/bash
# 1. Realice un script que guarde en el archivo /tmp/usuarios los nombres de los usuarios del
# sistema cuyo UID sea mayor a 1000.

limit=1000
working_dir=/tmp/usuarios

# por si hay ejecuciones previas borro el archivo temporal, si es que existe
if [ -e $working_dir ]; then rm $working_dir; fi

cat /etc/passwd | while read line
do
	name=`echo $line | cut -d":" -f1`
	uid=`echo $line | cut -d":" -f3`
	if [ $uid -gt $limit ]
	then
		echo $name >> $working_dir
	fi
done

exit 0
