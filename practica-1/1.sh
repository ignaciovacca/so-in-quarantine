# 1. Realice un script que guarde en el archivo /tmp/usuarios los nombres de los usuarios del
# sistema cuyo UID sea mayor a 1000.
#
#!/bin/bash

limit=1000

# por si hay ejecuciones previas borro el archivo temporal
rm /tmp/usuarios

cat /etc/passwd | while read line
do
	name=`echo $line | cut -d":" -f1`
	uid=`echo $line | cut -d":" -f3`
	if [ $uid -ge $limit ]
	then
		echo $name >> /tmp/usuarios
	fi
done
